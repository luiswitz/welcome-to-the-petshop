require 'rails_helper'

RSpec.describe SchedulingJob, type: :job do
  include ActiveJob::TestHelper

  describe '#perform' do
    let(:scheduling) do
      Service.create(
        title: 'the-title',
        description: 'the-description',
        price: 100,
        observations: 'the-observations'
      )
    end

    subject(:job) { described_class.perform_later(scheduling) }

    it 'queues the job' do
      expect { job }.to have_enqueued_job
    end
  end
end
