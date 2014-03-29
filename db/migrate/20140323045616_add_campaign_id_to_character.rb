class AddCampaignIdToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :campaign_id, :integer

    Character.find_each do |c|
      user = c.user
      campaign = Campaign.vanilla_fate_core
      campaign.user = user
      campaign.characters = user.characters
      campaign.save
    end
  end
end
