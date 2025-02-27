class ProductsController < ApplicationController
  def index
    @products = Product.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @products }
    end
  end

  def inventory
    product = Product.find(params[:id])
    render json: product.inventory > 0 ? true : false, status: 200
  end

  def description
    product = Product.find(params[:id])
    render json: product.descrition, status: 200
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @product }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
