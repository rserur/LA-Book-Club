FactoryGirl.define do
  factory :book do |b|
    b.title { Faker::Company.name }
    b.year 1986
    b.description { Faker::Lorem.sentence(1) }

    association :author, factory: :author
    association :category, factory: :category
  end
end
