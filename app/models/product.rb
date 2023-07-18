class Product < ApplicationRecord
  has_many :bookings
  has_many_attached :photos
  belongs_to :user
  enum category: [:cameras, :clothes, :appliances, :jewelry, :sports, :outdoors, :events, :transportation, :tools, :baby]
  validates :name, :description, :rental_price_day, :category, presence: true
  validates :rental_price_day, numericality: { greater_than: 0 }
end
