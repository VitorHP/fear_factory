class TabletopController < ApplicationController
  def index
    @aspects = Aspect.last(5)
    @stress_tracks = StressTrack.last(2)
  end
end
