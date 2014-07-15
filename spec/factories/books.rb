FactoryGirl.define do
  factory :book do |b|
    b.title { Faker::Address.city + ' ' +  Faker::Commerce.color.capitalize}
    b.year 1986
    b.description { Faker::Company.catch_phrase }

    association :author, factory: :author
    association :category, factory: :category
  end
end
