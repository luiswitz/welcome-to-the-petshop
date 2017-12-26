class Order < ApplicationRecord
  include Fae::BaseModelConcern
  enum status: { finished: 0, canceled: 1 }

  belongs_to :discount
  belongs_to :client

  has_many :order_products
  has_many :products, through: :order_products

  has_many :order_services
  has_many :services, through: :order_services

  validates :client, presence: true

  before_save :set_total

  def fae_display_field
    id
  end

  def self.for_fae_index
    order(:id)
  end

  private

  def set_total
    self.total = products.map(&:price).inject(0, :+)
    self.total += services.map(&:price).inject(0, :+)

    apply_discount_to_total
  end

  def apply_discount_to_total
    if discount.present?
      if discount.value > self.total
        self.total = 0
      else
        self.total -= discount.value
      end
    end
  end
end
