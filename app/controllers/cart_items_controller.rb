class CartItemsController < ApplicationController
  before_action :authenticate_user!
  def create
    @cart=current_cart
    @product=Product.find(params[:product_id])
    

    item=@cart.cart_items.find_by(product_id: @product.id)

    if item.present?
      item.quantity += 1
      item.save
    else
    item=@cart.cart_items.create(product: @product,quantity:1)
    end

    redirect_to cart_path(current_cart)
  end

  def destroy
    @item=current_cart.cart_items.find(params[:id])
    @item.destroy
    redirect_to cart_path(current_cart)
  end
end
