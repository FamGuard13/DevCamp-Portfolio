class Feature < ApplicationRecord
  belongs_to :portfolio

  mount_uploader :img, FeatureUploader
end
