include ActionDispatch::TestProcess

FactoryBot.define do
  factory :post do
    description "test test test"
    image { fixture_file_upload(Rails.root.join('spec', 'support', 'test.jpg'), 'image/jpeg') }
  end
end
