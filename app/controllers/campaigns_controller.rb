class CampaignsController < ApplicationController
  def index
    @campaigns = current_user.campaigns
  end

  def new
    @campaign = Campaign.vanilla_fate_core
  end

  def edit
    @campaign = Campaign.find params[:id]
  end

  def create
    @campaign = current_user.campaigns.build campaign_params

    if @campaign.update
      redirect_to campaigns_path
    else
      render :new
    end
  end

  def update
    @campaign = current_user.campaigns.find params[:id]

    if @campaign.update_attributes campaign_params
      redirect_to campaigns_path
    else
      render :edit
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit([
      :number_of_aspects,
      :number_of_phases,
      :skill_type_id,
      :refresh_rate,
      :number_of_initial_stunts,
      :number_of_stress_boxes,
      :skill_type_id,
      stress_tracks_attributes: [
        :id,
        :name,
        :skill_id,
        stress_levels_attributes: [
          :id,
          :level
        ]
      ],
      consequences_attributes: [
        :id,
        :level
      ]
    ])
  end
end
