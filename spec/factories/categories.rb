FactoryGirl.define do
  factory :category do |c|
    c.name { Faker::Lorem.word }
  end
end
