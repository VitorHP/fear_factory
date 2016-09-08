class Consequence < ActiveRecord::Base
  belongs_to :consequential, polymorphic: true
  belongs_to :skill

  default_scope ->{ order(:level) }

  scope :mild, ->{ where(level: 2) }
  scope :moderate, ->{ where(level: 4) }
  scope :severe, ->{ where(level: 6) }
end
