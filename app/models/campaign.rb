class Campaign < ActiveRecord::Base
  has_many :characters
  has_many :stress_tracks, as: :stressable, dependent: :destroy
  has_many :consequences, as: :consequential, dependent: :destroy
  belongs_to :skill_type

  accepts_nested_attributes_for :stress_tracks
  accepts_nested_attributes_for :consequences
end
