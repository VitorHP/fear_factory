class AddSkillGroupIdToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :skill_group_id, :integer
  end
end
