class Skill < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
  has_many :characters, through: :ratings
  has_many :stress_tracks
  has_many :consequences
  belongs_to :skill_group

  def name
    I18n.t("activerecord.attributes.skill.#{self['name'].to_s.parameterize.underscore}", default: self['name'])
  end

  scope :from_skill_group, ->(skill_group_id){ where(skill_group_id: skill_group_id) }
end
