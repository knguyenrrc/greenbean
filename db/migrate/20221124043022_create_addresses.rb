class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :city
      t.string :postal_code
      t.references :Customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
