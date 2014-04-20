class AddAliasToSkillType < ActiveRecord::Migration
  def change
    add_column :skill_types, :alias, :string
  end
end
