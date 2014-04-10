class AddUserIdToSkillGroups < ActiveRecord::Migration
  def change
    add_column :skill_groups, :user_id, :integer
  end
end
