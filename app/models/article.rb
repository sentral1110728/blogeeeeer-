class Article < ApplicationRecord
  # articleが削除されたときarticleに紐付くlikeも削除
  has_many :likes, dependent: :destroy
  belongs_to :user
  has_many :comments
  belongs_to :category

  def like_user(id)
    likes.find_by(user_id: id)
  end
end
