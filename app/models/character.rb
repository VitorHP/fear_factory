class Character < ActiveRecord::Base
  has_many :aspects, as: :aspectable, dependent: :destroy
  has_many :ratings, as: :rateable,   dependent: :destroy
  has_many :stunts,  as: :stuntable,  dependent: :destroy
  has_many :skills,  through: :ratings
  has_many :extras,  dependent: :destroy
  has_many :stress_tracks, as: :stressable
  has_many :consequences, as: :consequential
  belongs_to :campaign
  belongs_to :user

  accepts_nested_attributes_for :aspects
  accepts_nested_attributes_for :ratings
  accepts_nested_attributes_for :stunts
  accepts_nested_attributes_for :extras
  accepts_nested_attributes_for :stress_tracks
  accepts_nested_attributes_for :consequences

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true

  scope :from_campaign, ->(campaign){ where(campaign_id: campaign.id) }

  delegate :id, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :user, prefix: true, allow_nil: true

  def high_concept
    aspects.first.name
  end
end
