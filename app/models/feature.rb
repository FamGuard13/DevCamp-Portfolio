class Feature < ApplicationRecord
  belongs_to :portfolio

  mount_uploader :media, FeatureUploader
end
