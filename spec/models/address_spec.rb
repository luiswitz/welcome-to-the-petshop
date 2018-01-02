require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'associations' do
    it 'belongs to an adressable' do
      association = described_class.reflect_on_association(:addressable)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe 'validations' do
    it 'is not valid without a name' do
      address = described_class.new(name: '')
      expect(address).to_not be_valid
    end
  end
end
