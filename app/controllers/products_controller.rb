class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.all
  end

  # get :cameras
  def cameras
    @products = Product.where(category: 'cameras')
  end
  # get :clothes
  def clothes
    @products = Product.where(category: 'clothes')
  end
  # get :appliances
  def appliances
    @products = Product.where(category: 'appliances')
  end
  # get :jewelry
  def jewelry
    @products = Product.where(category: 'jewelry')
  end
  # get :sports
  def sports
    @products = Product.where(category: 'sports')
  end
  # get :outdoors
  def outdoors
    @products = Product.where(category: 'outdoors')
  end
  # get :events
  def events
    @products = Product.where(category: 'events')
  end
  # get :transportation
  def transportation
    @products = Product.where(category: 'transportation')
  end
  # get :tools
  def tools
    @products = Product.where(category: 'tools')
  end
  # get :baby
  def baby
    @products = Product.where(category: 'baby')
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
