require 'rails_helper'

RSpec.describe MarketingMailer, type: :mailer do
  describe '#campaign' do
    let(:mail) do
      MarketingMailer.campaign(
        Client.new(email: 'the-email'),
        'the-title',
        'the-body'
      )
    end

    it 'renders the headers' do
      expect(mail.subject).to eq('the-title')
      expect(mail.to).to eq(['the-email'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('the-body')
    end
  end
end
