# frozen_string_literal: true

class AddAllIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :acts, :activity, unique: true
    add_index :calendar_records, :start_time
    add_index :calendar_records, :end_time
    add_index :services, :name, unique: true
  end
end
