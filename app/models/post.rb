class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true
  has_many :likes, as: :likable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates :user, presence: true
  validates :content, presence: true, associated: true

  default_scope { order(id: :desc) }

  paginates_per 12
end
