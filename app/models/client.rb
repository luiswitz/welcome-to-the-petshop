class Client < ApplicationRecord
  include Fae::BaseModelConcern

  has_many :campaign_clients
  has_many :campaigns, through: :campaign_clients, dependent: :destroy
  has_many :addresses, as: :addressable

  accepts_nested_attributes_for :addresses, allow_destroy: true

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
