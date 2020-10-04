FactoryBot.define do
  factory :user do    
    name { Faker::Name.name  }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone_with_country_code}
    document { Faker::CPF.pretty }
    password { '123456'}

    trait :admin do
      role { 0 }
    end

    trait :regular do
      role { 1 }
    end
  end
end
