class Comment < ApplicationRecord
  belongs_to :food_item
  validates :name, :body, :rating, presence: true
end
