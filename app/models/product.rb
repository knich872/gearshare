class Product < ApplicationRecord
  has_many :bookings
  has_one :user
  enum category: [ :cameras, :clothes, :appliances, :jewelry, :sports, :outdoors, :events, :transportation, :tools, :baby ]
end
