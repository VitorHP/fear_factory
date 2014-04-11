class HouseRule < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :thirty_second_version, length: { in: 1..1000 }
  validates :description, length: { in: 1..10000 }
end
