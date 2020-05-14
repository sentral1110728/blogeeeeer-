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

  def self.search_articles(category_id, keyword, page, page_limit)
    if category_id.nil? || category_id == ''
      Article.where('title LIKE(?)', "%#{keyword}%")
             .includes([user: :profile])
             .paginate(page: page, per_page: page_limit)
    else
      Article.where('category_id LIKE(?) and title LIKE(?)', category_id.to_s, "%#{keyword}%")
             .includes([user: :profile])
             .paginate(page: page, per_page: page_limit)
    end
  end
end
