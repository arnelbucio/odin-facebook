class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user, index: true, null: false
      t.references :friend, index: true, null: false
      t.string :status, null: false

      t.index [:user_id, :friend_id], unique: true

      t.timestamps
    end
  end
end
