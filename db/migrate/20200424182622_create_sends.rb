class CreateSends < ActiveRecord::Migration[6.0]
  def change
    create_table :sends do |t|
      t.string :sender_phone_number
      t.string :recepient_phone_number
      t.string :sender_id_number
      t.string :amount
      t.string :pin

      t.timestamps
    end
  end
end
