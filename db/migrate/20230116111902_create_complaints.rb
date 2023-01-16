class CreateComplaints < ActiveRecord::Migration[7.0]
  def change
    create_table :complaints do |t|
      t.references :user, null: false
      t.references :employee, null: false
      t.text :message, null: false
      t.text :response
      t.string :status, null: false

      t.timestamps
    end
  end
end
