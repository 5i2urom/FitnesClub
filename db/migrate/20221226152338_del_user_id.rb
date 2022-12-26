class DelUserId < ActiveRecord::Migration[7.0]
  def change
    remove_reference :calendar_records, :user
  end
end
