class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
   def after_sign_in_path_for(resource_or_scope)
    if current_user
    	product_index_path
    elsif current_seller
    	seller_side_products_path
    else
    	new_user_session_path
  	end
  end
end
