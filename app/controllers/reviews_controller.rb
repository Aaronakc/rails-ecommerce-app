class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product =Product.find(params[:product_id])
    @review= @product.reviews.new(review_params.merge(user_id:current_user.id))
    if @review.save
      redirect_to product_path(@product)
    else
      flash[:alert]="Invalid params"
      redirect_to product_path(@product)
    end
  end

   def destroy
   @product =Product.find(params[:product_id])
   @review=@product.reviews.find(params[:id])
   @review.destroy
   redirect_to product_path(@product),notice:"review deleted successfully"
   end

 
  
  private
  def review_params
    params.require(:review).permit(:comment,:rating)
  end
end