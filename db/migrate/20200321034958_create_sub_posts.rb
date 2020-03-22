class CreateSubPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_posts do |t|
      t.belongs_to :subfed
      t.belongs_to :post

      t.timestamps
    end
  end
end
