FactoryBot.define do

    factory :brand do
      name { Faker::Lorem.sentence }
    end
end