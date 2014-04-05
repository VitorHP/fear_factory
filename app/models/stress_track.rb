class StressTrack < ActiveRecord::Base
  has_many :stress_levels, dependent: :destroy
  belongs_to :stressable, polymorphic: true
  belongs_to :skill

  accepts_nested_attributes_for :stress_levels, allow_destroy: true, reject_if: :all_blank

  def skill_name
    skill.present? ? skill.name : ''
  end
end
