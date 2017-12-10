class SellerSideProductsController < ApplicationController
	def create
	
		@product_seller = ProductSeller.new(active_params)
		
		if @product_seller.save
			redirect_to seller_side_product_path(@product_seller)
		else
			render 'new'
		end
	end

	def all
		@product_seller = ProductSeller.all
	end
	def show
		@product_seller = ProductSeller.find(params[:id])
	end

	def edit
		@product_seller = ProductSeller.find(params[:id])
		
	end

	def destroy
		@product_seller = ProductSeller.find(params[:id])
		@product_seller.destroy
		redirect_to seller_side_products_all_path
	end

	def update
		@product_seller = ProductSeller.find(params[:id])
		
		if @product_seller.update(active_params)
			redirect_to seller_side_product_path(@product_seller)
		else
			render 'edit'
		end
	end


	private 
	def active_params
		params.require(:product_seller).permit(:pro_name, :price, :units, :avatar)
	end
end
