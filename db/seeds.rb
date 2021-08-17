# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Person.destroy_all

100.times do
  Person.create(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    citizenship: Faker::Nation.nationality,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    source_base: nil,
    end_sanctions_time: Faker::Date.forward(days: 756)
  )
end

Person.reindex