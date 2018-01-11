require 'rails_helper'

RSpec.describe Order do
  let(:product) { create(:product, price: 10.0) }
  let(:service) { create(:service, price: 15.0) }

  let(:money_discount) { create(:discount, :money, value: 5.0) }
  let(:percentual_discount) { create(:discount, :percentual, value: 50.0) }

  let!(:order) { create(:order, products: [product], services: [service]) }

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
    context 'money discount' do
      it 'applies the discount' do
        order.discount = money_discount
        order.send(:apply_discount_to_total)

        expect(order.total).to eq(20.0)
      end

      it 'applies a discount bigger than the total' do
        money_discount.value = 200
        order.discount = money_discount
        order.send(:apply_discount_to_total)

        expect(order.total).to eq(0)
      end
    end

    context 'percentual discount' do
      it 'applies the discount' do
        order.discount = percentual_discount
        order.send(:apply_discount_to_total)

        expect(order.total).to eq(12.5)
      end

      it 'calculates a discount bigger than the value' do
        percentual_discount.value = 200
        order.discount = percentual_discount
        order.send(:apply_discount_to_total)

        expect(order.total).to eq(0)
      end
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
