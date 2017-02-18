class Order < ApplicationRecord
  belongs_to :food_item
  validates :quantity, :name, :phone, :address, presence: true, numericality: true
end
