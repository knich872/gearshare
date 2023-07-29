class Booking < ApplicationRecord
  belongs_to :product
  belongs_to :user
  enum status: {pending: "pending", accepted: "accepted", rejected: "rejected", canceled: "canceled", complete: "complete"}, _default: "pending"
  validates :start_date, :end_date, :user, :product, presence: true
  validate :valid_dates
  has_one :owner, through: :product, source: :user
  def pending?
    status == 'pending'
  end

  def accepeted?
    status == 'accepted'
  end

  # def canceled?
  #   status == 'canceled'
  # end

  # def rejected?
  #   status == 'rejected'
  # end

  private

  def valid_dates
    errors.add(:start_date, 'must be before end date') if start_date > end_date
  end
end
