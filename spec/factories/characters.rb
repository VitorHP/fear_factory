# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :character do
    name "James"
  end

  factory :fate_core_character, parent: :character do
    name "James LeBlank"

    aspects [ FactoryGirl.create(:aspect, name: "Tentado pelo lado negro") ]
  end
end
