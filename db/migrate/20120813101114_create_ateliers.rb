class CreateAteliers < ActiveRecord::Migration
  def change
    create_table :ateliers do |t|
      t.string :title
      t.integer :stage_id

      t.timestamps
    end
  end
end
