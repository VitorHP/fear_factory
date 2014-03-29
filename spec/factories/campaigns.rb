# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    number_of_aspects 1
    number_of_phases 1
  end

  factory :fate_core_campaign, class: 'Campaign' do
    number_of_aspects 5
    number_of_phases 1
    number_of_initial_stunts 3
    refresh_rate 3
  end
end
