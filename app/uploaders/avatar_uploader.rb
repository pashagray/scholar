# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  permissions 0604

  storage :file

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fill: [600, 600]

  version :thumb do
    process :resize_to_fill => [200, 200]
  end

  version :message do
    process :resize_to_fill => [24, 24]
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end

  def content_type_whitelist
    /image\//
  end

  def content_type_blacklist
    ['application/text', 'application/json']
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
