class Item < ApplicationRecord
  belongs_to :category
  validates_presence_of :name, :price
end
