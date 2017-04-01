class Rating < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true
  belongs_to :skill
  has_many :characters

  default_scope ->{ order(:id) }

  delegate :name, to: :skill, prefix: true, allow_nil: true
end
