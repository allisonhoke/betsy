class ReviewsController < ApplicationController
  before_action :set_review, only: [:show]
  before_action :set_product_or_merchant, only: [:index, :show, :new]

  def index
    @reviews = Review.all.where(product_id: params[:product_id])
  end


  def show; end

  def new
    if @merchant.id == @product.merchant_id
      render :review_error
    else
      @review = Review.new
    end
  end

  def edit
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def create
    if Review.create!(review_params)
      if params[:product_id]
        redirect_to product_reviews_path(params[:product_id])
      elsif params[:merchant_id]
        redirect_to merchant_product_reviews_path(params[:merchant_id])
      end
    else
      render :new
    end
  end


  def update

  end


  def destroy
    @review.destroy

  end

  private

    def set_review
      @review = Review.find(params[:id])
    end


    def review_params
      params.require(:review).permit(:rating_description, :rating, :product_id)
    end

    def set_product_or_merchant
      begin
        @product = Product.find(params[:product_id])
        @merchant = Merchant.find(params[:merchant_id])
      rescue
        nil
      end
    end
end
