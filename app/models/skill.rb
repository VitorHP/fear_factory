class Skill < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
  has_many :characters, through: :ratings
  has_many :stress_tracks
  has_many :consequences
  belongs_to :skill_group
end
