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

    if @campaign.save
      redirect_to campaign_path(@campaign)
    else
      render :new
    end
  end

  def update
    @campaign = current_user.campaigns.find params[:id]

    if @campaign.update_attributes campaign_params
      redirect_to campaign_path(@campaign)
    else
      render :edit
    end
  end

  def show
    @campaign = current_user.campaigns.find params[:id]
  end

  private

  def campaign_params
    params.require(:campaign).permit([
      :name,
      :number_of_aspects,
      :number_of_phases,
      :skill_type_id,
      :refresh_rate,
      :number_of_initial_stunts,
      :number_of_stress_boxes,
      :skill_cap,
      :skill_type_id,
      :skill_group_id,
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
        :name,
        :level
      ]
    ])
  end
end
