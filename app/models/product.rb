class Product < ApplicationRecord
  has_many :bookings
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
  belongs_to :user
  enum category: [:cameras, :clothes, :appliances, :jewelry, :sports, :outdoors, :events, :transportation, :tools, :baby]
  validates :name, :description, :rental_price_day, :category, presence: true
  validates :rental_price_day, numericality: { greater_than: 0 }

  include PgSearch::Model

  pg_search_scope :search_by_keywords,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
