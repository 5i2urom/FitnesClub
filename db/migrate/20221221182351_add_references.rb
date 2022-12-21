class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :coaches, :service_act
  end
end