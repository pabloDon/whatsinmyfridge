# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    login "MyString"
    email "MyString"
    crypted_password "MyString"
    password_salt "MyString"
    persistence_token "MyString"
    perishable_token "MyString"
  end
end
