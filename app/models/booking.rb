class Booking < ApplicationRecord
  belongs_to :product
  belongs_to :user
  enum status: {pending: "pending", accepted: "accepted", rejected: "rejected", canceled: "canceled", complete: "complete"}, _default: "pending"
  validates :start_date, :end_date, :user, :product, presence: true
  validate :valid_dates

  private

  def valid_dates
    errors.add(:start_date, 'must be before end date') if start_date > end_date
  end
end
