# frozen_string_literal: true

class CreateClubActs < ActiveRecord::Migration[7.0]
  def change
    create_table :club_acts do |t|
      t.belongs_to :club, null: false, index: true
      t.belongs_to :service_act, null: false, index: true

      t.timestamps
    end
  end
end
