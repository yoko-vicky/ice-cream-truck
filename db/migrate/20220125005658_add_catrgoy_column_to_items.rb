class AddCatrgoyColumnToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :category, foreign_key: true
  end
end
