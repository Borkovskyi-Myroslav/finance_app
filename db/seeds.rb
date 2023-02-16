# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

10.times do |id|
  Category.create(
    name: Faker::Hobby.activity  ,
    description: Faker::Lorem.sentence(word_count: 3)
  )
end

120.times do |id|
  Operation.create(
    amount: Faker::Number.between(from: 0, to: 4000),
    odate: Faker::Date.between(from:'2023-01-01', to: '2023-04-30'),
    description: Faker::Lorem.sentence(word_count: 3),
    transaction_type: [0].sample,
    category_id: Faker::Number.between(from: 0, to: 13)
  )
end

10.times do |id|
  Operation.create(
    amount: Faker::Number.between(from: 0, to: 1000),
    odate: Faker::Date.between(from:'2023-01-01', to: '2023-04-30'),
    description: Faker::Lorem.sentence(word_count: 3),
    transaction_type: [10].sample,
    category_id: 14
  )
end