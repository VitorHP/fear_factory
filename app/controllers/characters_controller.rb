class CharactersController < ApplicationController
  load_and_authorize_resource

  def index
    @characters.from_campaign(campaign)
  end

  def new
    @skills = Skill.all
  end

  def create
    @character = current_user.characters.build character_params

    if @character.save
      redirect_to campaign_characters_path(campaign_id: campaign)
    else
      @skills    = Skill.where.not(id: @character.skill_ids)
      render :new
    end
  end

  def edit
    @character = Character.find(params[:id])
    @skills    = Skill.where.not(id: @character.skill_ids)
  end

  def update
    @character = Character.find params[:id]

    if @character.update_attributes character_params
      redirect_to campaign_characters_path(campaign_id: campaign)
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

  def campaign
    @campaign = Campaign.find params[:campaign_id]
  end
end
