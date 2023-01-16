class AddTheme < ActiveRecord::Migration[7.0]
  def change
    add_column :complaints, :theme, :string, null: false
  end
end
