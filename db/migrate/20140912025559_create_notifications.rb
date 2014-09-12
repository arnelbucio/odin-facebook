class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true
      t.references :resource, polymorphic: true, index: true
      t.string :action
      t.boolean :seen, default: false

      t.timestamps
    end
  end
end
