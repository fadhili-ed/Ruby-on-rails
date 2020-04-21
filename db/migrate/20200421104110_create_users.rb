class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :id_number
      t.string :phone_number
      t.string :pin
      t.float :balance
      t.string :password

      t.timestamps
    end
  end
end
