class Rating < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true
  belongs_to :skill
  has_many :characters


  delegate :name, to: :skill, prefix: true, allow_nil: true

  default_scope ->{ order(:id) }
  scope :attributes, ->{ where(skill: { skill_group_id: SkillGroup::ATTRIBUTES }) }
end
