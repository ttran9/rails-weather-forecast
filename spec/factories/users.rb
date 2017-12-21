FactoryBot.define do
  sequence :email do |n|
    "test#{n}@test.com" # generate random values for part of email.
  end

  factory :user do
    email {generate :email}
    password 'asdfasdf'
  end
end
