class SkillGroup < ActiveRecord::Base
  MENTAL_ATTRIBUTES = 1
  PHYSICAL_ATTRIBUTES = 2
  SOCIAL_ATTRIBUTES = 3
  MENTAL_SKILLS = 4
  PHYSICAL_SKILLS = 5
  SOCIAL_SKILLS = 6
  MENTAL_MERITS = 7
  PHYSICAL_MERITS = 8
  SOCIAL_MERITS = 9
  HEALTH = 10
  MORALITY = 11
  WILLPOWER = 12

  has_many :skills

  validates :name, presence: true

  accepts_nested_attributes_for :skills, allow_destroy: true, reject_if: :all_blank

  scope :merits, ->{ where(id: [ MENTAL_MERITS, PHYSICAL_MERITS, SOCIAL_MERITS ]) }
end
