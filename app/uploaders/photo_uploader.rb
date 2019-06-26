class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # process eager: true  # Force version generation at upload time

  # version :default do
  #   resize_to_fit height: 384
  # end
end
