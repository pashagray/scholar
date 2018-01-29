class AttachmentUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:

  def store_dir
    "uploads/#{Setting.aws_folder_name}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def image?
   self.url.split('.').last.in?(['png', 'jpeg', 'jpg', 'bmp'])
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [200, 200]
  end

  version :messenger do
    process :create_messenger_version
  end

  def create_messenger_version
    img = Magick::Image.read(current_path)
    width = img[0].columns
    height = img[0].rows
    if width > height
      # original is landscape
      resize_to_fill(638, 392)
    else
      # original is portrait
      resize_to_fit(638, 392)
    end
  end
  # version :medium do
  #   process :resize_to_fill => [638, ]
  # end
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
