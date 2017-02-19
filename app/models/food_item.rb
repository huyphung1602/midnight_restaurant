class FoodItem < ApplicationRecord
  belongs_to :section
  validates :name, :price, presence: true
  has_many :orders, dependent: :destroy 

  def image_url_or_default
    image_url.presence || "http://loremflickr.com/320/240/#{name.gsub(' ', '')}"
  end

  def self.search(search)
    where("name || description ILIKE ?", "%#{search}%")
  end

end
