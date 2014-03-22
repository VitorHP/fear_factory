class StressLevel < ActiveRecord::Base
  belongs_to :stress_track

  default_scope -> { order(:level) }
end
