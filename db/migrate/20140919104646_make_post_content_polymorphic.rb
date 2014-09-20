class MakePostContentPolymorphic < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.remove :content
      t.references :content, polymorphic: true, index: true
    end
  end
end
