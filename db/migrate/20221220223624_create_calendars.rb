class CreateCalendars < ActiveRecord::Migration[7.0]
  def change
    create_table :calendars do |t|
      t.integer :service_id
      t.integer :calendar_activity_id
      t.integer :club_id
      t.string :coach_id
      t.date :date

      t.timestamps
    end
  end
end
