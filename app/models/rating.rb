class Rating < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true
  belongs_to :skill
  has_many :characters

  scope :great, ->{ where(level: 4) }
  scope :good, ->{ where(level: 3) }
  scope :fair, ->{ where(level: 2) }
  scope :averag, ->{ where(level: 1) }

  default_scope ->{ order(:id) }

  delegate :name, to: :skill, prefix: 'skill', allow_nil: true
end
