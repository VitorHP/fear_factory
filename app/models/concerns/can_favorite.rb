module CanFavorite
  extend ActiveSupport::Concern

  included do
    has_many :favorites
  end

  def favorited? favable
    favorites.find_by(favable_type: favable.class.to_s, favable_id: favable.id).present?
  end

  def favorite favable
    favorites.create favable: favable
  end

  def unfavorite favable
    favorites.find_by(favable_type: favable.class.to_s, favable_id: favable.id).destroy
  end
end
