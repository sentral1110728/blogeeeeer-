class Article < ApplicationRecord
  has_many :likes, dependent: :destroy
  belongs_to :user
  has_many :comments
end
