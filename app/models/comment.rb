class Comment < ActiveRecord::Base
  default_scope { order(id: :asc) }

  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :likes, as: :likable, dependent: :destroy

  validates :user, presence: true
  validates :content, presence: true
  validates :commentable, presence: true
end
