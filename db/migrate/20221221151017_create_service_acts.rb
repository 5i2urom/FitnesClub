class CreateServiceActs < ActiveRecord::Migration[7.0]
  def change
    create_table :service_acts do |t|
      t.string :service, null: false
      t.string :activity, null: false, unique: true

      t.timestamps
    end
  end
end
