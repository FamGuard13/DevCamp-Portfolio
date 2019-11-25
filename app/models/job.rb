class Job < ApplicationRecord
  validates_presence_of :name, :location, :description, :title, :start_date

  mount_uploader :img, ImageUploader
  mount_uploader :logo, ImageUploader
  
end

# , :logo, :img