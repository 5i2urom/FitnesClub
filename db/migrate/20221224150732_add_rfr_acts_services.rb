# frozen_string_literal: true

class AddRfrActsServices < ActiveRecord::Migration[7.0]
  def change
    add_reference :acts, :service
  end
end
