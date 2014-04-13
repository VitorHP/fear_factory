module Favable
  extend ActiveSupport::Concern

  included do
    has_many :favorites, as: :favable, dependent: :destroy
  end

  def favorited_by? user
    favorites.find_by(user_id: user.id).present?
  end

  def favorited_by user
    favorites.create user: user
  end

  def unfavorited_by user
    favorites.find_by(user_id: user.id).destroy
  end
end

