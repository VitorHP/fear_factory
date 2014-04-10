class AddNameToCampaigns < ActiveRecord::Migration
  def up
    add_column :campaigns, :name, :string

  end

  def down
    remove_column :campaigns, :name
  end
end
