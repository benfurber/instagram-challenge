FactoryBot.define do
  factory :user do
    email "test@test.com"
    username "test_1"
    password "testing123...4"
    password_confirmation "testing123...4"
  end
end
