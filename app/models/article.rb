class Article < ApplicationRecord
  # articleが削除されたときarticleに紐付くlikeも削除
  has_many :likes, dependent: :destroy
  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :category

  validates :title,
    presence: true,
    length: { maximum: 40 }

  validates :content,
    presence: true

  def like_user(id)
    likes.find_by(user_id: id)
  end
end
