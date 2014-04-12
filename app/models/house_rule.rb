class HouseRule < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  acts_as_taggable_on :tags
  acts_as_votable
  acts_as_commentable

  belongs_to :user

  validates :type_tags, :idiom, :name, presence: true
  validates :thirty_second_version, length: { in: 0..5000 }
  validates :description, length: { in: 0..50000 }

  def type_tags= tags
    self.tag_list.add(tags, parse: true)
  end

  def type_tags
    tag_list
  end

  private

  def slug_candidates
    [
      :name,
      [:name, :id]
    ]
  end

end
