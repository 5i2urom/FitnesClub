# frozen_string_literal: true

class RmAct < ActiveRecord::Migration[7.0]
  def change
    remove_reference :calendar_records, :act
  end
end
