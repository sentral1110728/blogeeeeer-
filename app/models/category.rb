class Category < ApplicationRecord
  has_many :articles, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :category_name,
            presence: true,
            uniqueness: true,
            length: { maximum: 20 }

  validates :image,
            presence: true

  def self.category_image(image)
    unless image.nil?
      img = MiniMagick::Image.read(image)
      img.resize '300x300'
    end
  end
end
