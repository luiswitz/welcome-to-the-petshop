class Product < ApplicationRecord
  include Fae::BaseModelConcern

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true

  def fae_display_field
    title
  end

  has_fae_image :hero_image


  belongs_to :supplier
end
