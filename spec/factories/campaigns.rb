# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    number_of_aspects 1
    number_of_phases 1
  end

  factory :fate_core_campaign, class: 'Campaign' do
    name 'Fate Core'
    number_of_aspects 5
    number_of_phases 1
    number_of_initial_stunts 3
    refresh_rate 3
    number_of_stress_boxes 3
    skill_cap 4

    association :skill_group, factory: :skill_group

    after(:create) do |campaign, evaluator|
      create_list(:stress_track, 1, stressable_id: campaign.id, stressable_type: 'Campaign')
    end

    after(:create) do |campaign, evaluator|
      create_list(:consequence, 1, consequential_id: campaign.id, consequential_type: 'Campaign')
    end
  end

end
