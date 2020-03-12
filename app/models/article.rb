class Article < ApplicationRecord
  has_many :likes, dependent: :destroy
  belongs_to :user
  has_many :comments
  
  def like_user(id)
    likes.find_by(user_id: id)
  end
end
