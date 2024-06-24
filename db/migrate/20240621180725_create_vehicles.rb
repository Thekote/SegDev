# frozen_string_literal: true

class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.integer :year

      t.timestamps
    end
  end
end
