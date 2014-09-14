class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :user, presence: true
  validates :content, presence: true
  validates :commentable, presence: true
end
