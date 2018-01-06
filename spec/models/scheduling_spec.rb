require 'rails_helper'

RSpec.describe Scheduling, type: :model do
  describe 'associations' do
    it 'belgons to a client' do
      association = described_class.reflect_on_association(:client)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many services' do
      association = described_class.reflect_on_association(:services)
      expect(association.macro).to eq(:has_many)
    end
  end
end
