class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :models , :id => false do |t|
      t.primary_key :id
      t.references :brand, null: false, foreign_key: true
      t.string :name
      t.float :average_price

      t.timestamps
    end
  end
end
