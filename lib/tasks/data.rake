namespace :data do
  desc "Migrate data for campaings"
  task :campaigns => :environment do
    Consequence.find_each do |r|
      r.consequential_id = r.character_id
      r.consequential_type = 'Character'
      r.save
    end

    User.find_each do |user|
      campaign = Campaign.vanilla_fate_core
      campaign.characters = user.characters
      campaign.save
      user.campaigns << campaign
      user.save
    end

    StressTrack.find_each do |s|
      s.update_attributes name: "#{s.name} Stress"
    end

    Campaign.find_each do |campaign|
      campaign.update_attributes name: 'Fate Core'
    end

    SkillGroup.create name: 'Fate Core', skill_ids: Skill.pluck(:id)

    SkillType.create name: "Pyramid"
    SkillType.create name: "Columns"
  end
end
