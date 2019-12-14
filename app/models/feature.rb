class Feature < ApplicationRecord
  belongs_to :portfolio

  mount_uploader :img, ImageUploader
  mount_uploader :video, VideoUploader
end
