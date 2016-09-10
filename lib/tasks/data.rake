
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

  desc "Cleans up empty aspects, stunts, extras and stress tracks"
  task clean_empty_stuff: :environment do
    Aspect.where(name: "").destroy_all
    Stunt.where(name: "", description: "").destroy_all
    Extra.where(name: "", description: "").destroy_all
    StressTrack.where(name: "").destroy_all
  end

  desc "Normalizes ratings count among old characters"
  task normalize_ratings: :environment do
    Character.find_each do |c|
      [[5, 4], [4, 3], [3, 2], [2, 1]].each do |level, count|
        count.times do
          c.ratings.create(level: level)
        end
      end
    end
  end
end
