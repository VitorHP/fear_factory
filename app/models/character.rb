class Character < ActiveRecord::Base
  has_many :ratings, as: :rateable,   dependent: :destroy
  has_many :skills,  through: :ratings
  belongs_to :user

  accepts_nested_attributes_for :ratings

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true

  delegate :id, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :user, prefix: true, allow_nil: true
end
