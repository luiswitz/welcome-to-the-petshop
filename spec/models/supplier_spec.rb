require 'rails_helper'

RSpec.describe Supplier do
  let(:supplier) { create(:supplier) }

  it 'is not valid without a name' do
    supplier.name = nil
    expect(supplier).to_not be_valid
  end

  it 'is not valid without a phone number' do
    supplier.phone = nil
    expect(supplier).to_not be_valid
  end

  it 'is not valid without an email' do
    supplier.email = nil
    expect(supplier).to_not be_valid
  end

  it 'can\'t have a duplicated email' do
    supplier2 = supplier.dup
    expect(supplier2).to_not be_valid
  end
end
