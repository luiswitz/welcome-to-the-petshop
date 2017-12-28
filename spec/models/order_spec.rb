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

  let(:product) do
    Product.create(
      title: 'the-title',
      description: 'the-description',
      price: 10.0,
      observations: 'the-obsercations'
    )
  end

  let(:service) do
    Service.create(
      title: 'the-title',
      description: 'the-description',
      price: 15.0,
      observations: 'the-obsercations'
    )
  end

  let(:discount) do
    Discount.create(
      title: 'the-discount',
      value: 5.0
    )
  end

  let!(:order) do
    Order.create(
      client: client,
      products: [product],
      services: [service]
    )
  end

  describe 'validations' do
    it 'is not valid without a client' do
      order.client = nil
      expect(order).to_not be_valid
    end
  end

  describe 'associations' do
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

  describe '#set_total' do
    it 'sums the value of services and products from a order' do
      expect(order.total).to eq(25.0)
    end
  end

  describe '#apply_discount_to_total' do
    it 'applies the discount' do
      order.discount = discount
      order.send(:apply_discount_to_total)

      expect(order.total).to eq(20.0)
    end

    it 'applies a discount bigger than the total' do
      order.discount = Discount.new(title: 'the-discount', value: 50)
      order.send(:apply_discount_to_total)

      expect(order.total).to eq(0)
    end
  end

  describe 'dependent destroy' do
    it 'destroy related products' do
      expect { order.destroy }.to change { OrderProduct.count }.by(-1)
    end

    it 'destroy related services' do
      expect { order.destroy }.to change { OrderService.count }.by(-1)
    end
  end
end
