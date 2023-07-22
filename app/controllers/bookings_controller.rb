class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @product = Product.find(params[:product_id])
    @booking.product = @product
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path, :notice => "Successfully created booking."
    else
      render 'product/show'
    end
  end

  def index
    @bookings = Booking.where(user: current_user)
    # raise
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
