class Discount < ApplicationRecord
  include Fae::BaseModelConcern

  enum kind: [:money, :percentual]

  validates :title, presence: true, uniqueness: true
  validates :value, presence: true
  validates :kind, presence: true

  def fae_display_field
    title
  end
end
