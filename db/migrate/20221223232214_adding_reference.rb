class AddingReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :calendar_records, :user
  end
end
