class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true, length: {minimum: 10, message: "Title must be AT LEAST 10 characters long"}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a url for gif, jpg or png image'
  }
end
