require 'rails_helper'

RSpec.describe CampaingJob, type: :job do
  include ActiveJob::TestHelper

  describe '#perform' do
    let(:client) { 'the-client' }
    let(:title) { 'the-title' }
    let(:body) { 'the-body' }

    subject(:job) { described_class.perform_later(client, title, body) }

    it 'queues the job' do
      expect { job }.to have_enqueued_job
    end
  end
end
