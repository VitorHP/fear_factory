class AddNameToCampaigns < ActiveRecord::Migration
  def up
    add_column :campaigns, :name, :string

    Campaign.find_each do |campaign|
      campaign.update_attributes name: 'Fate Core'
    end
  end

  def down
    remove_column :campaigns, :name
  end
end
