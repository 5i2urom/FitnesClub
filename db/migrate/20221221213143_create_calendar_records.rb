# frozen_string_literal: true

class CreateCalendarRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :calendar_records do |t|
      t.date :date_start
      t.date :date_end

      t.timestamps
    end
  end
end
