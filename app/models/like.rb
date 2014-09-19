class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :likable, polymorphic: true, counter_cache: true, touch: true

  validates :user, presence: true, uniqueness: { scope: [:likable_id, :likable_type] }
  validates :likable, presence: true
end
