class Sale < ApplicationRecord
  validates_presence_of :sold_date
  belongs_to :product, dependent: :destroy
  has_one :price, through: :product, source: :product_id, source_type: 'Product'
end
