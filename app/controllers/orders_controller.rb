class OrdersController < ApplicationController

	def all
		@orders = Order.where(:user_id => current_user.id)
		#@pro_id= params[:product_id]
		#@final_order = FinalOrderList.where(:user_id => current_user.id)
	end

	def new
		
		@order = Order.new
		

		@order = ProductSeller.find(params[:product_id])
	end

	

	def create
			@order = Order.new(active_paramss)
			@product_seller = ProductSeller.find(params[:product_id])
			@order.user_id =current_user.id

		if @order.save
			@order_product_seller= OrderProductSeller.create(:order_id => @order.id, :product_seller_id => @product_seller.id)
			redirect_to product_order_path(@product_seller,@order)
		else
			render 'new'
		end

	
	end

	def show

		@order = Order.find(params[:id])

		
	end
		def index 

		@orders = Order.where(:user_id => current_user.id)
		@pro_id= params[:product_id]
		@orders.each do |t|
		@final_order = FinalOrderList.create(pro_name: t.pro_name, price: t.price, units: t.units, user_id: current_user.id)

	end

		end

	

	def edit
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		
		if @order.update(active_paramss)
			redirect_to @order
		else
			render 'edit'
		end
	end

	def destroy

		@order = Order.find(params[:id])
		@order_product_seller = OrderProductSeller.find_by(:order_id => @order.id)
		@pro_id=@order_product_seller.product_seller_id
		if @order.destroy
			
		redirect_to product_orders_path(@pro_id)
		else
		 flash[:error] = "Order has not been deleted due to some error"
		end
	end


	def products
		@orders = Order.find(params[:id])
		
		@order_product= ProductSeller.find_by(:pro_name => @orders.pro_name)
	end


	private 
	def active_paramss
		
		params.require(:order).permit(:pro_name, :price, :units)

	end




end
