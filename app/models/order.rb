class Order < ApplicationRecord
  belongs_to :food_item
  validates :name, :phone, :address, presence: true
  validates :quantity, presence: true, numericality: true
end
