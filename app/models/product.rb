class Product < ApplicationRecord
  belongs_to :category
  has_many :sales

  validates :name, presence: true, uniqueness: true, length: { in: 3..15 }
  validates :price, presence: true
  validates :stock, presence: true

  scope :sort_by_latest, -> { order(created_at: :desc)}

  def total_sales
    self.price * self.sales.count
  end
end
