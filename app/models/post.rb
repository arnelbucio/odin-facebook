class Post < ActiveRecord::Base
  default_scope { order(id: :desc) }

  belongs_to :user
  has_many :likes, as: :likable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates :user, presence: true
  validates :content, presence: true
end
