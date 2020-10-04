class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :brand
      t.string :board
      t.integer :model_year
      t.integer :year_manufacture
      t.string :image
      t.string :descriptrion

      t.timestamps
    end
  end
end
