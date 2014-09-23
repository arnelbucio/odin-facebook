class TextPost < ActiveRecord::Base
  validates :content, presence: true
end
