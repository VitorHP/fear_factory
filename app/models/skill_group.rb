class SkillGroup < ActiveRecord::Base
  FATE_CORE = 1
  FATE_ACCELERATED = 2
  FATE_FREEPORT = 3

  has_many :skills

  validates :name, presence: true

  accepts_nested_attributes_for :skills, allow_destroy: true, reject_if: :all_blank

  scope :core, ->{ where(user_id: nil) }

end
