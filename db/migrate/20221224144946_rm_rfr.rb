# frozen_string_literal: true

class RmRfr < ActiveRecord::Migration[7.0]
  def change
    remove_reference :coaches, :service_act
    # remove_reference :calendar_records, :service_act
    remove_reference :club_acts, :service_act
    # remove_column :club_acts, :service_act
    # add_column t.belongs_to :service_act, null: false, index: true
  end
end
