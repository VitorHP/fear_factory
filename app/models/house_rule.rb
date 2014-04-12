class HouseRule < ActiveRecord::Base
  acts_as_taggable_on :tags

  belongs_to :user

  validates :tags, :idiom, :name, presence: true
  validates :thirty_second_version, length: { in: 0..1000 }
  validates :description, length: { in: 0..10000 }

  def tags= tags
    self.tag_list.add(tags, parse: true)
  end

  def tags
    tag_list
  end
end