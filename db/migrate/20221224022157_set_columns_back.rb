class SetColumnsBack < ActiveRecord::Migration[7.0]
  def change
    add_column(:calendar_records, :start_time, :date)
    add_column(:calendar_records, :end_time, :date)
  end
end
