# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    number_of_aspects 1
    number_of_phases 1
  end
end
