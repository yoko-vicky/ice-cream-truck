class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.datetime :sold_date

      t.timestamps
    end
  end
end
