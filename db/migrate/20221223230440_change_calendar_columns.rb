class ChangeCalendarColumns< ActiveRecord::Migration[7.0]
  def change
    change_column(:calendar_records, :date_start, :string)
    change_column(:calendar_records, :date_end, :string)
  end
end
