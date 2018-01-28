class AttachmentUploader < CarrierWave::Uploader::Base

  # storage :file
  storage :fog

  def store_dir
    "uploads/#{Setting.aws_folder_name}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
