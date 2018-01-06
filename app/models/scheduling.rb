class Scheduling < ApplicationRecord
  include Fae::BaseModelConcern

  enum status: { scheduled: 1, finished: 2, canceled: 3 }

  belongs_to :client
  has_many :scheduling_services
  has_many :services, through: :scheduling_services

  validates :client, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :services, presence: true

  def fae_display_field; end

  def self.for_fae_index
    order(:date)
  end
end
