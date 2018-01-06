class Scheduling < ApplicationRecord
  include Fae::BaseModelConcern

  belongs_to :client
  has_many :scheduling_services
  has_many :services, through: :scheduling_services

  def fae_display_field
    
  end

end
