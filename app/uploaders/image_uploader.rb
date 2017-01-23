class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [400, 400]
  storage :file

  # if Rails.env.production?
  #   storage :fog
  # else
  #   storage :file
  # end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path("imagedefault/" +
      [version_name, "book.png"].compact.join('_'))
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
