class Sale < ApplicationRecord
  validates_presence_of :sold_date
  belongs_to :product, dependent: :destroy
end
