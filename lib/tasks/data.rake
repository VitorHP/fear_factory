
namespace :data do
  task :load => :environment do
    SkillType.create({
      name: 'Pyramid',
      alias: 'pyramid',
      pyramid: [4, 3, 3, 2, 2, 2, 1, 1, 1, 1]
    })

    SkillType.create({
      name: 'List',
      alias: 'list'
    })

    Campaign.find_each do |campaign|
      campaign.skill_type = SkillType.find_by alias: 'pyramid'
      campaign.save validate: false
    end

  end
end
