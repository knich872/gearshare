class Owners::BookingsController < ApplicationController
  before_action :set_owner

  # Show all bookings for the owner
  def index
    # @bookings = Booking.where(user: current_user)
    # @owner = current_owner
    @bookings = @owner.bookings.includes(:product, :user)
  end

  # Confirm a booking
  def update
    # @owner = current_owner
    booking_ids = params[:booking_ids]
    new_status = params[:status]

    if booking_ids.present?
      bookings = @owner.bookings.where(id: booking_ids)
      bookings.update_all(status: new_status)
      redirect_to owners_bookings_path, notice: "Booking statuses updated successfully."
    else
      redirect_to owners_bookings_path, alert: "No bookings selected to update."
    end
  end

  private

  def set_owner
    @owner = current_user # Assuming you have a method to get the currently logged-in owner/user.
  end
end

# Copy from slack
# def update
#   @booking = Booking.find(params[:id])
#   if @booking.update(booking_params)
#   # redirect_to # up to you...
#   else
#   # render # where was the booking update form?
#   end
# end

# private

# def booking_params
#   # TODO: check your model, might be different than mine
#   params.require(:booking).permit(:status, :start_time, :end_time)
# end
