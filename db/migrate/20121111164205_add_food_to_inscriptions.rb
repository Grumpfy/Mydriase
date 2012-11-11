class AddFoodToInscriptions < ActiveRecord::Migration
  def change
    add_column :inscriptions, :vegetarian, :boolean, default: false
    add_column :inscriptions, :food_notes, :text, default: ""
  end
end
