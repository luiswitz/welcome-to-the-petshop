class ClientAddress < ApplicationRecord
  belongs_to :client
  validates :address, presence: true
end
