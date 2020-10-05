class AddUserToReservedCar < ActiveRecord::Migration[6.0]
  def change
    add_reference :reserved_cars, :user, null: false, foreign_key: true
  end
end
