class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
    @bookings = Booking.all.order(:start_date, :status)
    # raise
  end

  def create
    @booking = Booking.new(booking_params)
    @product = Product.find(params[:product_id])
    @booking.product = @product
    @booking.user = current_user
    @booking.chatroom = Chatroom.create
    if @booking.save
      redirect_to bookings_path, :notice => "Successfully created booking."
    else
      render 'products/show'
    end
  end

  def update
    @booking = Booking.find(params[:id])

    @booking.accepted?
    @booking.update(booking_params)
    redirect_to owners_bookings_path, notice: "Booking was successfully updated."
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
