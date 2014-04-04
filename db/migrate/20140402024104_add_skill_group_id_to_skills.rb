class AddSkillGroupIdToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :skill_group_id, :integer

    SkillGroup.create name: 'Fate Core', skill_ids: Skill.pluck(:id)
  end
end
