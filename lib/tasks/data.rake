
namespace :data do
 task :load => :environment do
    Consequence.find_each do |r|
      r.consequential_id = r.character_id
      r.consequential_type = 'Character'
      r.save
    end
    User.first_or_create({ email: 'vitorhp2@yahoo.com.br'})do |user|
      user.name = 'Vitor'
      user.password = '12345678'
      user.password_confirmation = '12345678'
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
    SkillGroup.create name: 'Fate Core', skills: [
      Skill.create(name: 'Careful'),
      Skill.create(name: 'Clever'),
      Skill.create(name: 'Flashy'),
      Skill.create(name: 'Forcefull'),
      Skill.create(name: 'Quick'),
      Skill.create(name: 'Sneaky'),
    ]
  end
end
