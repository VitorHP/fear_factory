class Rating < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true
  belongs_to :skill

  scope :great, ->{ where(level: 4) }
  scope :good, ->{ where(level: 3) }
  scope :fair, ->{ where(level: 2) }
  scope :average, ->{ where(level: 1) }

  default_scope ->{ order(:id) }
end
