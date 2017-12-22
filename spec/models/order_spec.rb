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
end
