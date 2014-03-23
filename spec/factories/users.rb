# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name){ |n| "charlin_#{n}_na_cam" }
    sequence(:email){ |n| "darwin#{n}@evo.lution" }
    password Devise.friendly_token.first(8)
  end
end
