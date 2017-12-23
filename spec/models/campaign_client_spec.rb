require 'rails_helper'

RSpec.describe CampaignClient, type: :model do
  it 'belongs to a campaign' do
    association = described_class.reflect_on_association(:campaign)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'belongs to a client' do
    association = described_class.reflect_on_association(:client)
    expect(association.macro).to eq(:belongs_to)
  end
end
