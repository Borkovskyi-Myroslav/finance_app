FactoryBot.define do
  factory :operation do
    amount { Faker::Number.between(from: 0, to: 4000) }
    odate { Faker::Date.between(from: '2023-01-01', to: '2023-04-30') }
    description { Faker::Lorem.sentence(word_count: 3) }
    transaction_type { Operation.transaction_types.keys.first }
  end
end

