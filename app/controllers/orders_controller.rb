class OrdersController < ApplicationController
before_action :authenticate_user!

def index
@orders=current_user.orders
end

def create
    cart=current_user.cart

    if cart.nil? || cart.cart_items.empty?
     redirect_to products_path
     return
    end

     order=current_user.orders.new(status:"Pending")
     total_price=0

     cart.cart_items.each do |item|
      order.order_items.new(
        product: item.product,
        quantity: item.quantity,
        price: item.product.price
      )
      total_price += item.quantity * item.product.price
     end

      order.total_price=total_price


      if order.save
        cart.cart_items.destroy_all
        redirect_to order_path(order),notice:"Order successful"
      else
        redirect_to cart_path,notice:"Something went wrong ,Please try again later"
      end
end
      
  

def show
  @order=current_user.orders.find(params[:id])
end

def destroy
end
end
