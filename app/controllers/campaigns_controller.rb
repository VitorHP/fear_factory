class CampaignsController < ApplicationController
  def index
    @campaign = Campaign.all
  end

  def new
    @campaign = Campaign.new

    stress_tracks = [
      {name: 'mental', skill_id: 18},
      { name: 'physical', skill_id: 12}
    ]

    stress_tracks.reverse.each do |skill|
      @campaign.stress_tracks.build(name: skill[:name], skill_id: skill[:skill_id]) do |stress_track|
        [1, 2, 3, 4].each do |level|
          stress_track.stress_levels.build level: level
        end
      end
    end

    consequences = [
      {name: 'mild', level: 2},
      {name: 'moderate', level: 4},
      {name: 'severe', level: 6},
      {name: 'mild', level: 2, skill_id: 12, skill_level_to_unlock: 5},
    ]

    consequences.each do |consequence|
      @campaign.consequences.build consequence
    end
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
