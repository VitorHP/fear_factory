# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :skill_group do
    name "MyString"

    after(:create) do |skill_group, evaluator|
      create_list(:skill, 1, skill_group_id: skill_group.id)
    end
  end
end
