class Owners::BookingsController < ApplicationController

  # Action to show all bookings for the owner

  def index
    # @bookings = @owner.bookings.includes(:product, :user)
    @bookings = Booking.includes(:product).where(products: { user: current_user })
  end

  # Confirm a booking
end
