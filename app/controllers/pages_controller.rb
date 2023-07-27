class PagesController < ApplicationController

  def home
    if params[:query].present?
      @products = Product.search_by_keywords(params[:query])
    end
  end
end
