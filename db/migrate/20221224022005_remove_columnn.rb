class RemoveColumnn < ActiveRecord::Migration[7.0]
  def change
    remove_column :calendar_records, :start_time
    remove_column :calendar_records, :end_time
  end
end
