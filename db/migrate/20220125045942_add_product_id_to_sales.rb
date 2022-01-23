class AddProductIdToSales < ActiveRecord::Migration[6.1]
  def change
    add_reference :sales, :product, foreign_key: true
  end
end
