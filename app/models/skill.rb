class Skill < ActiveRecord::Base
  has_many :ratings
  has_many :characters, through: :ratings
end
