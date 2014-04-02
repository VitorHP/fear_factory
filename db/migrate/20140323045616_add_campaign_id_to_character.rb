class AddCampaignIdToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :campaign_id, :integer

    User.find_each do |user|
      campaign = Campaign.vanilla_fate_core
      campaign.characters = user.characters
      campaign.save
      user.campaigns << campaign
      user.save
    end
  end
end
