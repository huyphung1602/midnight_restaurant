class AddInfoToFoodItems < ActiveRecord::Migration[5.0]
  def change
    add_column :food_items, :cuisine, :string
  end
end
