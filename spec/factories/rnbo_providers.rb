FactoryBot.define do
  factory :rnbo_factory_person, class: Hash do
    first_name         { Faker::Name.name }
    last_name          { Faker::Name.last_name }
    citizenship        { Faker::Nation.nationality }
    birthday           { Faker::Date.birthday(min_age: 18, max_age: 65) }
    provider_id        { Faker::Number.between(from: 1, to: 2) } 
    end_sanctions_time { Faker::Date.forward(days: 756) } 
  end
end
