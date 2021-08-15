class ProductsController < ApplicationController
  before_action :find_product, only:[:show,:update,:edit,:destroy]

  def index
    @products = Product.order(params[id: :desc])  
  end
  
  def new
    @product = Product.new  
  end

  def show
    @product = Product.find(params[:id])  
  end

  def update
    if @product.update(product_params)
       redirect_to "/products" 
    else
       render :edit
    end  
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to "/products"  
    else
      render :new  
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to "/products"
  end

  def edit
    @product = Product.find(params[:id])  
  end
  
  private
  def product_params
    params.require(:product).permit(:title,:price,:describe,:is_active)  
  end

  def find_product
    @product = Product.find(params[:id])
  end

end
