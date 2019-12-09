class Job < ApplicationRecord
  validates_presence_of :name, :location, :description, :title, :start_date, :img, :description_img, :experience_img

  mount_uploader :img, ImageUploader
  mount_uploader :logo, ImageUploader
  mount_uploader :description_img, ImageUploader
  mount_uploader :experience_img, ImageUploader
  
end