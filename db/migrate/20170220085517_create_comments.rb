class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :food_item, foreign_key: true
      t.string :name
      t.text :body
      t.integer :rating

      t.timestamps
    end
  end
end
