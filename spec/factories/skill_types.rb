# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :skill_type do
    name "pyramid"
    self.alias "pyramid"
    pyramid [5, 4, 4, 3, 3, 2, 2, 2, 1, 1, 1, 1]
    number_of_columns 1
    number_of_points 1
  end
end
