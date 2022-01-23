class Category < ApplicationRecord
  has_many :items
  validates_presence_of :name, :max, :stock
end
