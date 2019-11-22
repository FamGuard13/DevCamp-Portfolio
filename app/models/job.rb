class Job < ApplicationRecord
  validates_presence_of :name, :logo, :img, :location, :description, :title, :start_date

  mount_uploader :img, ImageUploader
  mount_uploader :logo, ImageUploader
  
end