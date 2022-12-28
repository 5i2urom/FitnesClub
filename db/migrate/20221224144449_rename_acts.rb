# frozen_string_literal: true

class RenameActs < ActiveRecord::Migration[7.0]
  def change
    rename_table :service_acts, :acts
  end
end
