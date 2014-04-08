class AddTypeToSkillGroups < ActiveRecord::Migration
  def change
    add_column :skill_groups, :type, :string
  end
end
