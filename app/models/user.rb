class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  has_many :comments
  has_one :profile
  belongs_to :authority
  # userが削除されたときuserに紐付くlikeも削除
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :profile
end
