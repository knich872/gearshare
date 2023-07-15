class Booking < ApplicationRecord
  belongs_to :product
  belongs_to :user
  enum staus: [ :pending, :accepted, :rejected, :canceled, :complete ]
end
