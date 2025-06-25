class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_cart
 



  def current_cart
    if user_signed_in? 
      current_user.cart || current_user.create_cart
    else
      nil
    end
  end

 

end
