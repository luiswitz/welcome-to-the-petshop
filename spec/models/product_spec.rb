require 'rails_helper'

RSpec.describe Product do
  let(:supplier) { create(:supplier) }
  let(:product) { create(:product, supplier: supplier) }

  it 'is not valid without a title' do
    product.title = nil
    expect(product).to_not be_valid
  end

  it 'cant have a duplicated title' do
    product2 = product.dup
    expect(product2).to_not be_valid
  end

  it 'is not valid without a price' do
    product.price = nil
    expect(product).to_not be_valid
  end
end
