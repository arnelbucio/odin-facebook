class AvatarUploader < CarrierWave::Uploader::Base
  VERSIONS = { :small => [100, 100], :thumb => [50, 50], :icon => [34, 34] }

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    gravatar_hash = Digest::MD5.hexdigest(model.email.downcase)
    size = VERSIONS[version_name].max
    "http://gravatar.com/avatar/#{gravatar_hash}.jpg?d=mm&r=pg&s=#{size}"
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :small do
    process :resize_to_fill => VERSIONS[:small]
  end

  version :thumb, :from_version => :small do
    process :resize_to_fill => VERSIONS[:thumb]
  end

  version :icon, :from_version => :thumb do
    process :resize_to_fill => VERSIONS[:icon]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
