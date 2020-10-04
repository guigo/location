class CreateReservedCars < ActiveRecord::Migration[6.0]
  def change
    create_table :reserved_cars do |t|
      t.references :car
      t.string :document
      t.datetime :start_at
      t.datetime :and_at

      t.timestamps
    end
  end
end
