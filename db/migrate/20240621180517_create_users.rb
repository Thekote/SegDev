# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :age
      t.integer :dependents
      t.integer :income
      t.string :marital_status
      t.boolean :risk_questions, array: true, default: [], null: false

      t.timestamps
    end
  end
end
