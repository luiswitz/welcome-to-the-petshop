class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true
  
  validates :name, presence: true
end
