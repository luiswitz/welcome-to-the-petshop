require 'rails_helper'

RSpec.describe Scheduling, type: :model do
  let(:service) { create(:service) }
  let(:scheduling) { create(:scheduling, services: [service]) }

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

  describe 'validations' do
    it 'is not valid without a client' do
      scheduling.client = nil
      expect(scheduling).to_not be_valid
    end

    it 'is not valid without a date' do
      scheduling.date = nil
      expect(scheduling).to_not be_valid
    end

    it 'is not valid without a time' do
      scheduling.time = nil
      expect(scheduling).to_not be_valid
    end

    it 'is not valid without a service' do
      scheduling.services = []
      expect(scheduling).to_not be_valid
    end
  end
end
