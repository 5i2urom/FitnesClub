class AddUniqueIndex < ActiveRecord::Migration[7.0]
  def change
   add_index :clubs, :name, unique: true
   add_index :clubs, :address, unique: true
   add_index :coaches, :name, unique: true
  end
end
