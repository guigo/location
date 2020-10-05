FactoryBot.define do
  factory :reserved_car do
    car
    document { Faker::CPF.pretty }
    start_at { Faker::Date.in_date_period }
    and_at { Faker::Date.in_date_period }
    user
  end
end
