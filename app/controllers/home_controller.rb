class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @characters = Character.all.order('created_at DESC')
    @campaign  = Campaign.vanilla_fate_core
  end
end
