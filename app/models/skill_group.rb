class SkillGroup < ActiveRecord::Base
  has_many :skills

  validates :name, presence: true

  accepts_nested_attributes_for :skills, allow_destroy: true, reject_if: :all_blank

  scope :core, ->{ where(user_id: nil) }

end
