require "rails_helper"

RSpec.describe SchedulingMailer, type: :mailer do
  let(:scheduling) do
    Scheduling.new(
      client: Client.new(email: 'the-email', name: 'the-name'),
      date: DateTime.now,
      time: '10:00',
      services: [
        Service.new(title: 'the-service')
      ]
    )
  end

  let(:mail) { described_class.details(scheduling) }

  describe '#details' do
    it 'renders the headers' do
      expect(mail.subject).to eq("You have a new scheduling")
      expect(mail.to).to eq([scheduling.client.email])
    end

    it 'has tha client name' do
      expect(mail.body.encoded).to match(scheduling.client.name)
    end

    it 'shows the date of scheduling' do
      expect(mail.body.encoded).to match(scheduling.date.to_s)
    end

    it 'shows the time of scheduling' do
      expect(mail.body.encoded).to match(scheduling.time.to_s)
    end

    it 'shows the related services of scheduling' do
      expect(mail.body.encoded).to match(scheduling.services.first.title)
    end
  end
end
