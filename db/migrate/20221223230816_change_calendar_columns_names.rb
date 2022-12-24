class ChangeCalendarColumnsNames < ActiveRecord::Migration[7.0]
  def change
    rename_column(:calendar_records, :date_start, :start_time)
    rename_column(:calendar_records, :date_end, :end_time)
  end
end
