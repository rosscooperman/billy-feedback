class ImageUploader < CarrierWave::Uploader::Base
	storage :fog     # :fog for production

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end