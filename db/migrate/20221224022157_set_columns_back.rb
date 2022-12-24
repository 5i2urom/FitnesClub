class SetColumnsBack < ActiveRecord::Migration[7.0]
  def change
    add_column(:calendar_records, :start_time, :datetime)
    add_column(:calendar_records, :end_time, :datetime)
  end
end
