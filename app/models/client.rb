class Client < ApplicationRecord
  include Fae::BaseModelConcern

  validates :phone, presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: Fae.validation_helpers.email_regex,
              message: 'A valid email format is required'
            }

  def fae_display_field
    name
  end
end
