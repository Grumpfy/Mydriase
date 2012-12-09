class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.decimal :price, precision: 8, scale: 2
      t.text :description

      t.timestamps
    end
  end
end
