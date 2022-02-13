FactoryBot.define do
  factory :event do
    association :user

    title { 'title' }
    description { 'description' }
    address { 'address' }
    datetime { Time.parse('13.02.2022, 00:00') }
  end
end