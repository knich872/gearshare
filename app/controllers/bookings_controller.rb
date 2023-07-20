class BookingsController < ApplicationController
  def create
    @booking = Booking.new(params[:booking])
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
  end
end
