class Feature < ApplicationRecord
  belongs_to :portfolio

  mount_uploader :img, ImageUploader
end
