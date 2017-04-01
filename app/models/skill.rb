class Skill < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
  has_many :characters, through: :ratings
  belongs_to :skill_group

  scope :from_skill_group, ->(skill_group_id){ where(skill_group_id: skill_group_id) }
end
