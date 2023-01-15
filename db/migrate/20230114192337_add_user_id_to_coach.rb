class AddUserIdToCoach < ActiveRecord::Migration[7.0]
  def change
    add_reference :coaches, :user
  end
end
