class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :stars, default: 0
      t.text :ip_address
      t.integer :quote_id

      t.timestamps
    end

    add_index :ratings, [:ip_address, :quote_id], unique: true
  end
end
