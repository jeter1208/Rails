class ProductsController < ApplicationController
    before_action :find_product,only:[:show,:edit,:update,:destroy]

    def index
      @products = Product.order(id: :desc)
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if product.save
        redirect_to  "/products"
      else  
        render :new  
      end
    end

    def show
    end

    def edit
    end

    def destroy
      @product.find(params[:id])
      @product.destroy
      redirect_to "/products"
    end

    def update
     if @product.update(product_params)
      redirect_to "/products"
     else
      reder :edit   
     end
    end


    private

    def find_product
      @product = product.find(params[:id]) 
    end

    def product_params
      params.require(:product).permit(:title,:price,:describe,:is_active)
    end
end
