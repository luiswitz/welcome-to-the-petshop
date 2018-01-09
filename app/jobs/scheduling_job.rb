class SchedulingJob < ApplicationJob
  queue_as :email

  def perform(scheduling)
    SchedulingMailer.details(scheduling).deliver_now
  end
end
