class AddUserIdToPayment < ActiveRecord::Migration
  def change
    add_column :locations, :lat, :decimal,
               :precision=>8,:scale=>4,:default=>0.1, :null => false
    add_column :locations, :lon, :decimal,
               :precision=>8,:scale=>4,:default=>0.1, :null => false
  end
end
