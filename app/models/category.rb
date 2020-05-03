class Category < ApplicationRecord
  has_many :articles
  mount_uploader :image, ImageUploader

  validates :category_name, 
    presence: true, 
    uniqueness: true, 
    length: { maximum: 20 }

  validates :image, 
    presence: true
end
