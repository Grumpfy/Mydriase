class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.decimal :price, precision: 8, scale: 2
      t.string :method
      t.text :description

      t.timestamps
    end
  end
end
