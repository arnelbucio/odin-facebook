class CreatePhotoPosts < ActiveRecord::Migration
  def change
    create_table :photo_posts do |t|
      t.string :photo, null: false

      t.timestamps
    end
  end
end
