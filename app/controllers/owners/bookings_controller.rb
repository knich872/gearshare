class Owners::BookingsController < ApplicationController

  # Action to show all bookings for the owner
  def index
    @bookings = current_owner.bookings
  end

  # Action to confirm a booking
  def update
    @booking = current_owner.bookings.find(params[:id])

    if @booking.update(confirmed: true)
      # Booking confirmed successfully
      redirect_to owner_booking_path(@booking), notice: 'Booking confirmed successfully.'
    else
      # Failed to confirm booking
      redirect_to owner_booking_path(@booking), alert: 'Failed to confirm booking.'
    end
  end
end
