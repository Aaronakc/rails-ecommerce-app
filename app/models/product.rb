class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items
  has_many :order_items
  has_many :reviews , dependent: :destroy
end
