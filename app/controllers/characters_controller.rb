class CharactersController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
    @skills = Skill.all

    @character = current_user.characters.build do |character|
      5.times { character.aspects.build }
      3.times { character.stunts.build }
      3.times { character.extras.build }

      [4, 3, 3, 2, 2, 2, 1, 1, 1, 1].each do |level|
        character.ratings.build level: level
      end

      stress_tracks = [
        {name: 'mental', skill_id: 18},
        { name: 'physical', skill_id: 12}
      ]

      stress_tracks.reverse.each do |skill|
        character.stress_tracks.build(name: skill[:name], skill_id: skill[:skill_id]) do |stress_track|
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
        character.consequences.build consequence
      end

    end
  end

  def create
    @character = Character.new permitted_params

    if @character.save
      redirect_to characters_path
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

    if @character.update_attributes permitted_params
      redirect_to characters_path
    else
      render :edit
    end
  end

  private

  def permitted_params
    params.require(:character).permit([
      :name, :description, :refresh,
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
end
