class Discount < ApplicationRecord
  include Fae::BaseModelConcern

  enum kind: { money: 1, percentual: 2 }

  validates :title, presence: true, uniqueness: true
  validates :value, presence: true, uniqueness: true
  validates :kind, presence: true

  def fae_display_field
    title
  end
end
