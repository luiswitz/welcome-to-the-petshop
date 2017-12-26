class Discount < ApplicationRecord
  include Fae::BaseModelConcern

  validates :title, presence: true, uniqueness: true
  validates :value, presence: true, uniqueness: true

  def fae_display_field
    title
  end
end
