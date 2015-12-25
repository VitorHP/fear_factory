# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :character do
    name "James"
    description "Stark"
  end

  factory :fate_core_character, parent: :character do
    name "James LeBlank"
    description "Stark"

    # aspects [ FactoryGirl.create(:aspect, name: "Tentado pelo lado negro") ]
  end
end
