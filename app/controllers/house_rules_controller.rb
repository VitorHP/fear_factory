class HouseRulesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    @house_rule = current_user.house_rules.build house_rule_params

    if @house_rule.save
      redirect_to house_rules_path(@campaign)
    else
      render :new
    end
  end

  def edit
    @house_rule = HouseRule.find(params[:id])
  end

  def update
    @house_rule = HouseRule.find params[:id]

    if @house_rule.update_attributes house_rule_params
      redirect_to house_rules_path(@campaign)
    else
      render :edit
    end
  end

  private

  def house_rule_params
    params.require(:house_rule).permit([
      :name, :thirty_second_version, :description
    ])
  end
end
