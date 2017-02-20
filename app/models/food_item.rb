class FoodItem < ApplicationRecord
  belongs_to :section
  validates :name, :price, presence: true
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy 

  def image_url_or_default
    image_url.presence || "http://loremflickr.com/320/240/#{name.gsub(' ', '')}"
  end

  def self.search(search)
    where("name || cuisine ILIKE ?", "%#{search}%")
  end

end
