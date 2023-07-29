class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  # skip_before_action :authenticate_user!, only: :index

  def index
    @products = Product.all
    if params[:query].present?
      @products = Product.search_by_keywords(params[:query])
    end
    if params[:filter].present?
      @products = @products.where(category: params[:filter])
    end

    @pagy, @products = pagy((@products), items: 12)
  end

  def show
    @booking = Booking.new
    @bookings = @product.bookings
  end

  def new
    @product = Product.new()
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to @product, notice: "Product was successfully added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :rental_price_day, :category, photos: [])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
