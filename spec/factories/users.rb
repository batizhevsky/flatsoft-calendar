FactoryGirl.define do 
  factory :user do
    username 'tester'
    email 'test@example.com'
    password 'god'
    password_confirmation 'god'
  end
end 
