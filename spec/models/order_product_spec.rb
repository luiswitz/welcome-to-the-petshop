require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  it 'belongs to an order' do
    association = described_class.reflect_on_association(:order)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'belongs to a product' do
    association = described_class.reflect_on_association(:product)
    expect(association.macro).to eq(:belongs_to)
  end
end
