class HomeController < ApplicationController
  def index
    @skills = Skill.pluck(:name)
    @character = Character.new do |character|
      5.times { character.aspects.build }
    end
  end
end
