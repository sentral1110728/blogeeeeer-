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

  validates :nickname, 
    presence: true,
    uniqueness: true,
    length: { maximum: 20 }

  validates :email,
    presence: true,
    uniqueness: true,
    length: { maximum: 50 }

  # def self.if_not_admin(current_user)
  #   unless current_user.blank?
  #     redirect_to root_path, notice: '無効なURLです' unless current_user.authority_id == 2
  #   else
  #     redirect_to root_path, notice: '無効なURLです'
  #   end
  # end
end
