class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes, as: :likable, dependent: :destroy

  validates :user, presence: true
  validates :content, presence: true
end
