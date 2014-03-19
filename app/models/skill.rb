class Skill < ActiveRecord::Base
  has_many :characters, through: :ratings
end
