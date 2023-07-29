class ReviewsController < ApplicationController
  # before_action :set_product, only: [:new, :create, :destroy]

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new(product: @product)
    # authorize @review
  end

  def create

    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product = @product
    # authorize @review
    if @review.save
      respond_to do |format|
        format.html { redirect_to product_path(@product) }
        format.json do
        render json: {
            review_html: render_to_string(partial: "reviews/review", formats: :html, locals: { review: @review }),
            form_html: render_to_string(partial: "reviews/new", formats: :html, locals: { product: @review.product, review: Review.new })
        }.to_json
        end
      end
    else
      respond_to do |format|
        format.html { render "products/show", status: :unprocessable_entity }
        format.json do
          render json: {
            form_html: render_to_string(partial: "reviews/new", formats: :html, locals: { product: @review.product, review: @review })
        }.to_json
        end
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to product_path(@review.product), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
