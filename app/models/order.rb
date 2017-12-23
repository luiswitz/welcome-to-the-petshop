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

  def fae_display_field
    id  
  end

  def self.for_fae_index
    order(:id)
  end

end
