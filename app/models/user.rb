class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :friendships, dependent: :destroy
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
    transaction do
      self.friendships.create! friend: friend, status: 'requested'
      friend.friendships.create! friend: self, status: 'pending'
    end
  end
end
