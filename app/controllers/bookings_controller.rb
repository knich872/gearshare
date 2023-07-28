class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
    @bookings = Booking.all.order(:status)
    # raise
  end

  def create
    @booking = Booking.new(booking_params)
    @product = Product.find(params[:product_id])
    @booking.product = @product
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path, :notice => "Successfully created booking."
    else
      render 'products/show'
    end
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.accepted? && booking_params[:status] == 'completed'
      @booking.update(booking_params)
      redirect_to owners_bookings_path, notice: "Booking was successfully updated."
    else
      # Handle the case when the booking is not accepted or status is not 'completed'
      redirect_to owners_bookings_path, alert: "You can only update 'Complete' status from 'Accept' booking status."
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
