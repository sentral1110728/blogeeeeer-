class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :user_image, ImageUploader
end
