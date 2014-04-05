class SkillGroupsController < ApplicationController

  def index
    @skill_groups = SkillGroup.all
  end

  def new
    @skill_group = SkillGroup.new
  end

  def create
    @skill_group = SkillGroup.new skill_group_params

    if @skill_group.save
      redirect_to campaign_skill_groups_path
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def skill_group_params
    params.require(:skill_group).permit(:name, skills_attributes: [:id, :name, :_destroy])
  end
end
