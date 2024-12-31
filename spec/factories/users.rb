FactoryBot.define do
  factory :user do
    name { 'Takao Suzuki' }
    sequence(:email) { |n| "takao#{n}@gmail.com" }
    password { 'foobar' }
    password_confirmation { 'foobar' }
  end
end
