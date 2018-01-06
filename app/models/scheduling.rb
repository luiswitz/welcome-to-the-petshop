class Scheduling < ApplicationRecord
  include Fae::BaseModelConcern

  def fae_display_field
    
  end


  belongs_to :client
end
