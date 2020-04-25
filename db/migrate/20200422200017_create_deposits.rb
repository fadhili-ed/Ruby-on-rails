class CreateDeposits < ActiveRecord::Migration[6.0]
  def change
    create_table :deposits do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :deposits, default: "0000"

      t.timestamps
    end
  end
end
