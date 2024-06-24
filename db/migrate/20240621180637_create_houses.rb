# frozen_string_literal: true

class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :ownership_status

      t.timestamps
    end
  end
end
