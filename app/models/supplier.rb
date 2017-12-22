class Supplier < ApplicationRecord
  include Fae::BaseModelConcern

  validates :name, presence: true
  validates :phone, presence: true
  validates :email,
    uniqueness: true,
    presence: true,
    format: {
      with: Fae.validation_helpers.email_regex,
      message: 'A valid email format is required'
    }

  def fae_display_field
    name
  end


end
