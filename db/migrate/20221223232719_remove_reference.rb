class RemoveReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :calendar_records, :service_act, index: true
  end
end
