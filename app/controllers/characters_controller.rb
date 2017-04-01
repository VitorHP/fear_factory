class CharactersController < ApplicationController

  # before_filter :authenticate_user!, only: [:new, :create, :update]

  def new
    @character = Presenters::Character.new(BuildCharacter.new.build(params[:character_type]))
  end

  def create
    @character = current_user.characters.build character_params

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
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @character = Character.find params[:id]
  end

  private

  def character_params
    params.require(:character).permit([
      :name, :description, :user_id,
      ratings_attributes: [:id, :skill_id, :level],
    ])
  end

  def fae_campaign
  end

end
