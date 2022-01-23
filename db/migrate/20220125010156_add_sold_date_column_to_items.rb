class AddSoldDateColumnToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :sold_date, :datetime, :default => nil
    #Ex:- :default =>''
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
