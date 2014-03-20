class Character < ActiveRecord::Base
  has_many :aspects, as: :aspectable, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :skills, through: :ratings

  accepts_nested_attributes_for :aspects
  accepts_nested_attributes_for :ratings
end
