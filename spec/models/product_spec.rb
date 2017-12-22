require 'rails_helper'

RSpec.describe Product do
  let(:supplier) do
    Supplier.create(
      name: 'the-supplier',
      email: 'supplier@mail.com', 
      phone: '9999999'
    ) 
  end

  let(:product) do
    Product.create(
      title: 'the-title',
      description: 'the-description',
      price: 100,
      observations: 'the-observations',
      supplier: supplier
    )
  end

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
