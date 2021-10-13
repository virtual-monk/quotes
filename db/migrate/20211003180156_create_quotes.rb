class CreateQuotes < ActiveRecord::Migration[6.1]
  def change
    create_table :quotes do |t|
      t.text :title, unique: true

      t.timestamps
    end
    add_index :quotes, :title
  end
end
