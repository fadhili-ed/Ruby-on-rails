class CreateWithdraws < ActiveRecord::Migration[6.0]
  def change
    create_table :withdraws do |t|
      t.string :first_name
      t.string :last_name
      t.string :id_number
      t.string :phone_number
      t.string :pin
      t.float :balance

      t.timestamps
    end
  end
end
