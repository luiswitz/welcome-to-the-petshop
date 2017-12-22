require 'rails_helper'

RSpec.describe Campaign do
  let(:campaign) do
    Campaign.new(title: 'the-title', body: 'the-body')
  end

  it 'is not valid without a title' do
    campaign.title = nil
    expect(campaign).to_not be_valid
  end

  it 'is not valid without a body' do
    campaign.body = nil
    expect(campaign).to_not be_valid
  end
end
