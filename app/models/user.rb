class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
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

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    ActiveRecord::Base.transaction do
      unless user
        user = User.create(
          uid:      auth.uid,
          provider: auth.provider,
          nickname: auth.info.nickname,
          email:    User.dummy_email(auth),
          password: Devise.friendly_token[0, 20]
        )
        Profile.create(user_id: user.id)
      end
    end

    user
  end

  def self.dummy_email(auth)
    auth.info.email || "#{auth.uid}-#{auth.provider}@example.com"
  end
  # def self.dummy_name(auth)
  #   "#{auth.uid}-#{auth.provider}"
  # end

  # def self.if_not_admin(current_user)
  #   unless current_user.blank?
  #     redirect_to root_path, notice: '無効なURLです' unless current_user.authority_id == 2
  #   else
  #     redirect_to root_path, notice: '無効なURLです'
  #   end
  # end
end
