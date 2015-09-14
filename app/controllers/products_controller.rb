class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    params[:product][:price] = params[:product][:price].gsub(",", "")
    product_params = params.require(:product).permit([:title, :price, :description, {category_ids: []}])
    @product = Product.new product_params
    if @product.save
      render text: "success"
    else
      render :new
    end
  end

  def show
    @product = Product.find params[:id]
    @comment = Comment.new
  end

  def index
    @products = Product.all
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    product_params = params.require(:product).permit(:title, :description, :price, {category_ids: []})
    if @product.update product_params
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

end
