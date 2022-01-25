class Category < ApplicationRecord
  has_many :products
  has_many :sales, through: :products

  # scope :sales, -> { where()}

  # def sales
  #   Sale.where(product_id: self.id)
  # end
end
