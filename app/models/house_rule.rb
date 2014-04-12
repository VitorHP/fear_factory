class HouseRule < ActiveRecord::Base
  acts_as_taggable_on :tags
  acts_as_votable
  acts_as_commentable

  belongs_to :user

  validates :type_tags, :idiom, :name, presence: true
  validates :thirty_second_version, length: { in: 0..1000 }
  validates :description, length: { in: 0..10000 }

  def type_tags= tags
    self.tag_list.add(tags, parse: true)
  end

  def type_tags
    tag_list
  end

end
