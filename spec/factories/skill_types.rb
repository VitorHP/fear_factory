# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :skill_type do
    name "MyString"
    pyramid "MyText"
    number_of_columns 1
    number_of_points 1
    skill_cap 1
  end
end
