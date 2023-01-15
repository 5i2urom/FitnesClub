class AddLimit < ActiveRecord::Migration[7.0]
  def change
    add_column :calendar_records, :limit, :integer
    add_index :calendar_records, :limit
  end
end
