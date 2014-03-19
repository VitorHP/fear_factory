class CharactersController < ApplicationController
  def create
    @character = Character.first_or_initialize permitted_params

    @character.save

    redirect_to root_path
  end

  private

  def permitted_params
    params.require(:character).permit([:name, :description, :refresh, skill_attributes: [:name], aspect_attributes: [:name]
  end
end
