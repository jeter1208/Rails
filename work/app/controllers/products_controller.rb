class ProductsController < ApplicationController
  def index
    @products = Product.all
    # order(id :dsec)  
  end
  def new
    @product = Product.new 
  end
 def create
    clean_product = params.require(:product).permit(:title,:price,:describe,:is_active)
    @product = Product.new(clean_product)
    if @product.save
        redirect_to "/products"
      else
        render :new
      end
 end
 def show
    @product = Product.find(params[:id])
 end
end
# Hero.where("age >= 10 and age <= 25")
