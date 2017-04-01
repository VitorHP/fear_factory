class SkillGroup < ActiveRecord::Base
  MENTAL_ATTRIBUTES = 1
  PHYSICAL_ATTRIBUTES = 2
  SOCIAL_ATTRIBUTES = 3
  MENTAL_SKILLS = 4
  PHYSICAL_SKILLS = 5
  SOCIAL_SKILLS = 6

  has_many :skills

  validates :name, presence: true

  accepts_nested_attributes_for :skills, allow_destroy: true, reject_if: :all_blank

  scope :core, ->{ where(user_id: nil) }
end
