class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def new
    @skills = Skill.all

    @character = Character.first_or_initialize do |character|
      5.times { character.aspects.build }

      [4, 3, 2 ,1].each do |level|
        (5 - level).times do |quant|
          character.ratings.build level: level
        end
      end

    end
  end

  def create
    @character = Character.new permitted_params

    if @character.save
      redirect_to characters_path
    else
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
    params.require(:character).permit([:name, :description, :refresh, ratings_attributes: [:id, :skill_id, :level], aspects_attributes: [:id, :name, :aspectable_id, :aspectable_type]])
  end
end
