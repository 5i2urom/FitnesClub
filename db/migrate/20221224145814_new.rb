# frozen_string_literal: true

class New < ActiveRecord::Migration[7.0]
  def change
    add_reference :coaches, :act
    add_reference :calendar_records, :act
    add_reference :club_acts, :act
  end
end
