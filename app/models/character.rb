class Character < ActiveRecord::Base
  has_many :aspects, as: :aspectable, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :skills, through: :ratings
  has_many :stunts, as: :stuntable, dependent: :destroy
  has_many :extras

  accepts_nested_attributes_for :aspects
  accepts_nested_attributes_for :ratings
  accepts_nested_attributes_for :stunts
  accepts_nested_attributes_for :extras

  validates :name, presence: true
end
