class DeleteNullFalse < ActiveRecord::Migration[7.0]
  def change
    change_column_null :complaints, :employee_id, true
  end
end
