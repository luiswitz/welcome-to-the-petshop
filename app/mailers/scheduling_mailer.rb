class SchedulingMailer < ApplicationMailer
  def details(scheduling)
    @scheduling = scheduling

    mail to: @scheduling.client.email, subject: "You have a new scheduling"
  end
end
