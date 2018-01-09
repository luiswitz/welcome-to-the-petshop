require 'rails_helper'

RSpec.describe Discount do
  let(:discount) do
    Discount.create(title: 'the-discount', value: 60.00)
  end

  it 'is not valid without a title' do
    discount.title = nil
    expect(discount).to_not be_valid
  end

  it 'is not valid with a duplicated title' do
    discount2 = discount.dup
    expect(discount2).to_not be_valid
  end

  it 'is not valid without a price' do
    discount.value = nil
    expect(discount).to_not be_valid
  end

  it 'is not valid withou a kind' do
    discount.kind = nil
    expect(discount).to_not be_valid
  end
end
