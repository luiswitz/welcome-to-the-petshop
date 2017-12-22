require 'rails_helper'

RSpec.describe Client do
  let(:client) do
    Client.create(
      name: 'the-name',
      email: 'the@email.com',
      observations: 'the-observations',
      phone: '99999999'
    )
  end

  it 'is not valid without a phone number' do
    client.phone = nil
    expect(client).to_not be_valid
  end

  it 'is not valid without an email' do
    client.email = nil
    expect(client).to_not be_valid
  end

  it 'can\'t have a duplicated email' do
    client2 = client.dup
    expect(client2).to_not be_valid
  end

end
