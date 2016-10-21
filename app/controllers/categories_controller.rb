class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def index
    @categories = Category.all
  end

  def show
    @category_products = @category.products
  end

  def new
    @category = Category.new
  end

  def create
    if @category.create!(category_params)
      redirect_to category_path(@category)
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
