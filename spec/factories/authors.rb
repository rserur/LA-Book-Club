FactoryGirl.define do
  factory :author do |a|
    a.first_name { Faker::Name.first_name }
    a.last_name { Faker::Name.last_name }
   end
end
