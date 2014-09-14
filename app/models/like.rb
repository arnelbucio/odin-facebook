class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :likable, polymorphic: true

  validates :user, presence: true, uniqueness: { scope: [:likable_id, :likable_type] }
  validates :likable, presence: true
end
