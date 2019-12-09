class School < ApplicationRecord
  validates_presence_of :name, :description, :start_date, :status, :location, :description_img, :experience_img, :img

  mount_uploader :img, ImageUploader
  mount_uploader :logo, ImageUploader
  mount_uploader :description_img, ImageUploader
  mount_uploader :experience_img, ImageUploader
end