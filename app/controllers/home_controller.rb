class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @characters = Character.all.limit(10)
  end
end
