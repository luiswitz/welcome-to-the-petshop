require 'rails_helper'

RSpec.describe OrderService, type: :model do
  it 'belongs to an order' do
    association = described_class.reflect_on_association(:order)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'belongs to a service' do
    association = described_class.reflect_on_association(:service)
    expect(association.macro).to eq(:belongs_to)
  end
end
