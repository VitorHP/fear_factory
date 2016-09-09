class Scene < ActiveRecord::Base
  has_many :aspects, as: :aspectable
  has_many :stress_tracks, as: :stressable

  belongs_to :campaign
end
