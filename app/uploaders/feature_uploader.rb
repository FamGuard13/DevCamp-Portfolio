class FeatureUploader < CarrierWave::Uploader::Base

  storage :aws

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(mp4 mkv jpg jpeg gif png svg)
  end

end
