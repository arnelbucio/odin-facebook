class TextPost < ActiveRecord::Base
  has_one :post, as: :content

  validates :content, presence: true
end
