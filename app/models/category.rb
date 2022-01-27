class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :sales, through: :products

  validates :name, presence: true, uniqueness: true, length: { in: 3..15 }
  validates :max, presence: true
end
