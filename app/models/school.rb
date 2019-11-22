class School < ApplicationRecord
  validates_presence_of :name, :logo, :img, :location, :description, :start_date

  mount_uploader :img, ImageUploader
  mount_uploader :logo, ImageUploader
end