require 'rails_helper'

RSpec.describe Service do
  let(:service) do
    Service.create(
      title: 'the-title',
      description: 'the-description',
      price: 100,
      observations: 'the-observations'
    )
  end

  it 'is not valid without a title' do
    service.title = nil
    expect(service).to_not be_valid
  end

  it 'cant have a duplicated title' do
    service2 = service.dup
    expect(service2).to_not be_valid
  end

  it 'is not valid without a price' do
    service.price = nil
    expect(service).to_not be_valid
  end
end
