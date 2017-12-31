require 'rails_helper'

RSpec.describe ClientAddress, type: :model do
  describe 'associations' do
    it 'belogns to a client' do
      association = described_class.reflect_on_association(:client)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe 'validations' do
    let(:client) do
      Client.create(name: 'the-name', email: 'the-email')
    end

    let(:client_address) do
      ClientAddress.new(client: client)
    end

    it 'is not valid without a address' do
      expect(client_address).to_not be_valid
    end
  end
end
