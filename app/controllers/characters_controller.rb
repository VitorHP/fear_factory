class CharactersController < ApplicationController

  def new
    @character = BuildCharacter.new.build(campaign: Campaign.vanilla_fate_core)
    @campaign  = Campaign.vanilla_fate_core
  end

  def create
    @character = Character.new character_params

    if @character.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find params[:id]

    if @character.update_attributes character_params
      redirect_to campaign_path(@campaign)
    else
      render :edit
    end
  end

  private

  def character_params
    params.require(:character).permit([
      :name, :description, :refresh, :user_id, :campaign_id,
      ratings_attributes: [:id, :skill_id, :level],
      aspects_attributes: [:id, :name, :aspectable_id, :aspectable_type],
      stunts_attributes: [:id, :name, :description],
      extras_attributes: [:id, :name, :description],
      stress_tracks_attributes: [:id, :name, :skill_id,
        stress_levels_attributes: [:id, :level, :checked]
      ],
      consequences_attributes: [:id, :level, :name, :description, :skill_id, :skill_level_to_unlock]
    ])
  end

  def fae_campaign
  end

end
