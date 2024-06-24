# frozen_string_literal: true

class AddUserIdToVehicles < ActiveRecord::Migration[7.0]
  def change
    add_reference :vehicles, :user, null: false, foreign_key: true
  end
end
