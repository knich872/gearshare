class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.all
  end

  def show; end

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
