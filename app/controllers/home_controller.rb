class HomeController < ApplicationController
  def index
    @skill_groups = current_user.custom_skill_groups
    @campaigns = current_user.campaigns
  end
end
