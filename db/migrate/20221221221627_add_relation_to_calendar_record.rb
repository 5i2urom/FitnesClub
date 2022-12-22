class AddRelationToCalendarRecord < ActiveRecord::Migration[7.0]
  def change
    add_reference :calendar_records, :service_act
    add_reference :calendar_records, :club
    add_reference :calendar_records, :coach
  end
end
