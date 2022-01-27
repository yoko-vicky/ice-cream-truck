class Product < ApplicationRecord
  belongs_to :category
  has_many :sales

  validates :name, presence: true, uniqueness: true, length: { in: 3..15 }
  validates :price, presence: true, length: { in: 1..4 }
  validates :stock, presence: true, length: { in: 1..4 }
end
