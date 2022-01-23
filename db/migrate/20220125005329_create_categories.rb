class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :max
      t.integer :stock
      t.timestamps
    end
  end
end
