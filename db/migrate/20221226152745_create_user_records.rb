# frozen_string_literal: true

class CreateUserRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :user_records do |t|
      t.belongs_to :calendar_record, null: false, index: true
      t.belongs_to :user, null: false, index: true

      t.timestamps
    end
  end
end
