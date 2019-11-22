class Job < ApplicationRecord
  validates_presence_of :name, :logo, :img, :link, :location, :description, :title, :start_date

  mount_uploader :logo, ImageUploader
  mount_uploader :img, ImageUploader
  
end