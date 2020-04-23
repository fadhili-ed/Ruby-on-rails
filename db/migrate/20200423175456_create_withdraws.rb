class CreateWithdraws < ActiveRecord::Migration[6.0]
  def change
    create_table :withdraws do |t|
      t.string :pin
      t.string :amount
      t.string :id_number

      t.timestamps
    end
  end
end
