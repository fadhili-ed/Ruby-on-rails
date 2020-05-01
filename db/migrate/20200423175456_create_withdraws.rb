# frozen_string_literal: true

class CreateWithdraws < ActiveRecord::Migration[6.0]
  def change
    create_table :withdraws do |t|
      t.string :pin, null: false
      t.string :amount, null: false
      t.string :id_number, null: false

      t.timestamps
    end
  end
end
