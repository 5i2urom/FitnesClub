class ChangeStatus < ActiveRecord::Migration[7.0]
  def change
    change_column :complaints, :status, :integer, using: 'status::integer'
  end
end
