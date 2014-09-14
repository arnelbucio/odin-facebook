class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friends,           -> { where("status = 'accepted'") },
                                    through: :friendships
  has_many :requested_friends, -> { where("status = 'requested'") },
                                    through: :friendships, source: :friend
  has_many :pending_friends,   -> { where("status = 'pending'") },
                                    through: :friendships, source: :friend

  validates :name, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       format: /\A[a-z][a-z0-9_\-]*\z/i,
                       length: { maximum: 20 }


  def send_friend_request!(friend)
    unless self.friends.include?(friend)
      transaction do
        self.friendships.create! friend: friend, status: 'requested'
        friend.friendships.create! friend: self, status: 'pending'
      end
    end
  end

  def accept_friend_request!(friend)
    if self.pending_friends.include?(friend)
      transaction do
        self.friendships.find_by(friend: friend).update_attribute(:status, 'accepted')
        friend.friendships.find_by(friend: self).update_attribute(:status, 'accepted')
      end
    end
  end

  def cancel_friendship!(friend)
    if self.requested_friends.include?(friend) || self.pending_friends.include?(friend)
      transaction do
        self.friendships.find_by(friend: friend).destroy
        friend.friendships.find_by(friend: self).destroy
      end
    end
  end

  def like!(likable)
    self.likes.create!(likable: likable)
  end

  def like?(likable)
    self.likes.exists?(likable: likable)
  end

  def notify(resource, action)
    self.notifications.create!(resource: resource, action: action)
  end
end
