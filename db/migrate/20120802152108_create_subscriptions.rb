class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :stage_id
      t.integer :user_id
      t.boolean :payed

      t.timestamps
    end
  end
end
