class AddSkillGroupIdToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :skill_group_id, :integer
  end
end
