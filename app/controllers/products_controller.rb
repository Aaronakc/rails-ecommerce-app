class ProductsController < ApplicationController
  require "http"
  require "json"
  
  def index
    if Product.count.zero?
      fetch_api_once
      @products = Product.all
    else
      @products= Product.all
    end
  end

  def show
    @product=Product.find(params[:id])
  end

  private

  def fetch_api_once
    response=HTTP.get("https://fakestoreapi.com/products")
    products=JSON.parse(response.to_s)

    products.each do |product|
      category=Category.find_or_create_by(name: product["category"])
      new_product=Product.new(
        name: product["title"],
        description: product["description"],
        image: product["image"],
        price: product["price"],
        category_id: category.id
      )
      new_product.save
    end
  end

end
