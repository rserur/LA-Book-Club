FactoryGirl.define do
  factory :review do |r|
    r.rating rand(5)
    body { Faker::Lorem.paragraph(1) }
  end
end
