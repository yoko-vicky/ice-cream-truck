class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :sales, through: :products
end
