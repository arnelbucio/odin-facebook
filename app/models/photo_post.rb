class PhotoPost < ActiveRecord::Base
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
