require 'rails_helper'

RSpec.describe Campaign do
  let(:campaign) { create(:campaign) }

  it 'is not valid without a title' do
    campaign.title = nil
    expect(campaign).to_not be_valid
  end

  it 'is not valid without a body' do
    campaign.body = nil
    expect(campaign).to_not be_valid
  end

  it 'has many clients' do
    association = described_class.reflect_on_association(:clients)
    expect(association.macro).to eq(:has_many)
  end
end
