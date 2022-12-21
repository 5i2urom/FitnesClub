class CreateClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :clubs do |t|
      t.string :name, null: false, unique: true
      t.text :address, null: false, unique: true

      t.timestamps
    end
  end
end
