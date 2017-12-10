class ShoppingCartController < ApplicationController
	


	def all
		@products = ProductSeller.all
	end

	def show
		@products = ProductSeller.find(params[:id])  
		
	end

	
	


	

end
