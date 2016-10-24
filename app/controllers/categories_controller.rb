class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def index
    @categories = Category.all
  end

  def show
    @category_products = @category.products
  end

  def new
    # Once we get @current_user figured out
    # if @current_user.merchant_id.nil?
    #   render :category_error
    # end
    @category = Category.new
  end

  def create
    if Category.create!(category_params)
      redirect_to categories_path
    else
      render :new
    end
  end

private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
