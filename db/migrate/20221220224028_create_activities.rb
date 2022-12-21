class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :service
      t.string :lesson
      t.integer :calendar_activity_id

      t.timestamps
    end
  end
end
