FactoryBot.define do
  factory :car do
    model { Faker::Vehicle.make_and_model }
    brand { Faker::Vehicle.make }
    board { Faker::Vehicle.license_plate }
    model_year { Faker::Vehicle.year }
    year_manufacture { Faker::Vehicle.year }
  
    descriptrion { Faker::Vehicle.car_options }
  end
end
