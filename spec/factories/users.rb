FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    profile {Faker::Lorem.sentence}
    occupation {Faker::Company.name}
    position {Faker::Commerce.department}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
