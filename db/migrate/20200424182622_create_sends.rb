# frozen_string_literal: true

class CreateSends < ActiveRecord::Migration[6.0]
  def change
    create_table :sends do |t|
      t.string :sender_phone_number, null: false
      t.string :recepient_phone_number, null: false
      t.string :sender_id_number, null: false
      t.string :amount, null: false
      t.string :pin, null: false

      t.timestamps
    end
  end
end
