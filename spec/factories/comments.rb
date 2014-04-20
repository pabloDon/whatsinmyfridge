# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    desc "MyText"
    user_id 1
    recipe_id 1
  end
end
