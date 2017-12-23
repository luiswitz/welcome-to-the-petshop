require 'rails_helper'

RSpec.describe Order do
  let(:client) do
    Client.create(
      name: 'the-name',
      email: 'the@email.com',
      observations: 'the-observations',
      phone: '99999999'
    )
  end

  let(:order) do
    Order.create(
      total: 199,
      client: client
    )
  end

  it 'is not valid without a client' do
    order.client = nil
    expect(order).to_not be_valid
  end

  it 'belogns to a discount' do
    association = described_class.reflect_on_association(:discount)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'belongs to a client' do
    association = described_class.reflect_on_association(:client)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'has many products' do
    association = described_class.reflect_on_association(:products)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many services' do
    association = described_class.reflect_on_association(:services)
    expect(association.macro).to eq(:has_many)
  end
end
