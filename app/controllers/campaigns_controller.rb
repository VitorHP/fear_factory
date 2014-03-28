class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.vanilla_fate_core
  end

  def edit
    @campaign = Campaign.find params[:id]
  end

  private

  def permitted_params
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
