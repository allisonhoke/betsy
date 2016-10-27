class ProductsController < ApplicationController
  before_action :set_product_or_merchant, only: [:show, :edit, :update, :destroy]

  before_action :cart, only: [:add_to_cart]

  def index
    if params[:category_id]
      @products = Category.find(params[:category_id]).products
      render :index
    elsif params[:merchant_id]
      @products = Merchant.find(params[:merchant_id]).products
      render :index
    end
    @products = Product.all
  end

  def show
    @order_item = OrderItem.new(product_id: @product.id)
    @latest_review = Review.all.where(product_id: params[:id]).order(:updated_at).first
  end

  # GET /products/new
  def new
    merchant = Merchant.find(params[:merchant_id]).id
    @product = Product.new(merchant_id: merchant)
  end

  def create
    merchant = Integer(params[:id])
    @product = Product.new(merchant_id: merchant)
    if @product.save
      respond_to do |format|
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      end
    else
      format.html { render :new }
      format.json { render json: @product.errors, status: :unprocessable_entity }
    end
  end

  def edit
    @product
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_or_merchant
      begin
        @product = Product.find(params[:id])
        @merchant = Merchant.find(params[:merchant_id])

      rescue
        nil
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :description, :photo_url, :stock)
    end
end
