class Sale < ApplicationRecord
  belongs_to :product, dependent: :destroy
  validates_presence_of :sold_date
end
