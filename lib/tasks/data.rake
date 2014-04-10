
namespace :data do
 task :fix_skills_index => :environment do
   conn = ActiveRecord::Base.connection
   conn.execute 'WITH mx AS ( SELECT MAX(id) as id FROM fate_development.skills) SELECT setval("fate_development.skills_id_seq", mx.id) AS curseq FROM mx;'
 end

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

    SkillGroup.create name: 'Fate Core', skill_ids: Skill.pluck(:id)

    SkillGroup.create name: 'Fate Accelerated', skills: [
      Skill.create(name: 'Careful'),
      Skill.create(name: 'Clever'),
      Skill.create(name: 'Flashy'),
      Skill.create(name: 'Forcefull'),
      Skill.create(name: 'Quick'),
      Skill.create(name: 'Sneaky'),
    ]

    User.find_each do |user|
      campaign = Campaign.vanilla_fate_core
      campaign.name = 'Fate Core'
      campaign.characters = user.characters
      campaign.user = user
      campaign.save

      user.campaigns << campaign
      user.save
    end

  end
end
