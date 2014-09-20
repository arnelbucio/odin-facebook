class PhotoPost < ActiveRecord::Base
  has_one :post, as: :content

  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
