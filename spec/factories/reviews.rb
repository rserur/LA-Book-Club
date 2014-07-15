FactoryGirl.define do
  factory :review do |r|
    r.rating 3
    r.body { Faker::Lorem.paragraph(1) }

    association :book, factory: :book
  end
end
