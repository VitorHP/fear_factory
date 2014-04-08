class CustomSkillGroupsController < ApplicationController

  def index
    @skill_groups = SkillGroup.all
    @custom_skill_groups = current_user.custom_skill_groups
  end

  def new
    @skill_group = CustomSkillGroup.new
  end

  def create
    @skill_group = current_user.custom_skill_groups.build skill_group_params

    if @skill_group.save
      redirect_to custom_skill_groups_path
    else
      render :new
    end
  end

  def edit
    @skill_group = current_user.custom_skill_groups.find params[:id]
  end

  def update
    @skill_group = current_user.custom_skill_groups.find params[:id]

    if @skill_group.update_attributes skill_group_params
      redirect_to custom_skill_groups_path
    else
      render :edit
    end
  end

  def destroy
    @skill_group = current_user.custom_skill_groups.find params[:id]
    @skill_group.destroy

    redirect_to custom_skill_groups_path
  end

  private

  def skill_group_params
    params.require(:custom_skill_group).permit(:name, skills_attributes: [:id, :name, :_destroy])
  end
end
