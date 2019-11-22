class School < ApplicationRecord
  validates_presence_of :name, :logo, :img, :link, :location, :description, :start_date

  mount_uploader :logo, ImageUploader
  mount_uploader :img, ImageUploader
end