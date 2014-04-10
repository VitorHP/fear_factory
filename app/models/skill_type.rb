class SkillType < ActiveRecord::Base
  has_many :skills

  serialize :pyramid, Array
end
