class School < ApplicationRecord
  validates_presence_of :name, :description, :start_date, :status, :location

  mount_uploader :img, ImageUploader
  mount_uploader :logo, ImageUploader
end

#, :logo, :img