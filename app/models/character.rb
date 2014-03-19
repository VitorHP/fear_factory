class Character < ActiveRecord::Base
  has_many :aspects, as: :aspectable
  has_many :ratings
  has_many :skills, through: :ratings

  accepts_nested_attributes_for :aspects
  accepts_nested_attributes_for :skills
end
