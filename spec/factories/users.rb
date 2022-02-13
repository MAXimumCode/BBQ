FactoryBot.define do
  factory :user do
    name { |_n| rand(999).to_s }

    sequence(:email) { |n| "email#{n}@email.com" }
    after(:build) { |u| u.password_confirmation = u.password = "1234567"}
  end
end