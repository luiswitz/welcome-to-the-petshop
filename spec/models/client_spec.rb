require 'rails_helper'

RSpec.describe Client do
  let(:campaign) do
    Campaign.create(
      title: 'the-title',
      body: 'the-body'
    )
  end

  let!(:client) do
    Client.create(
      name: 'the-name',
      email: 'the@email.com',
      observations: 'the-observations',
      phone: '99999999',
      campaigns: [campaign]
    )
  end

  describe 'associations' do
    it 'has many campaigns' do
      association = described_class.reflect_on_association(:campaigns)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many addresses' do
      association = described_class.reflect_on_association(:addresses)
      expect(association.macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    it 'is not valid without a phone number' do
      client.phone = nil
      expect(client).to_not be_valid
    end

    it 'is not valid without an email' do
      client.email = nil
      expect(client).to_not be_valid
    end

    it 'can\'t have a duplicated email' do
      client2 = client.dup
      expect(client2).to_not be_valid
    end
  end

  describe 'dependent destroy' do
    it 'destroy related campaigns from a client' do
      expect { client.destroy }.to change { CampaignClient.count }.by(-1)
    end
  end
end
