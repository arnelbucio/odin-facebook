class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :posts, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :comments, dependent: :destroy
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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.username = auth.info.nickname
    end
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes'], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

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

  def friend_and_self_ids
    friend_ids << self.id
  end

  def like!(likable)
    self.likes.create!(likable: likable)
  end

  def unlike!(likable)
    self.likes.find_by(likable: likable).destroy!
  end

  def like?(likable)
    self.likes.exists?(likable: likable)
  end

  def notify(resource, action)
    self.notifications.create!(resource: resource, action: action)
  end
end
