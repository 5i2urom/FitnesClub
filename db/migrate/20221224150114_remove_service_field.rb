# frozen_string_literal: true

class RemoveServiceField < ActiveRecord::Migration[7.0]
  def change
    remove_column :acts, :service
  end
end
