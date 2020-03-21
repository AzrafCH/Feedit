class CreateSubPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_posts do |t|
      t.string :subfed_id
      t.string :post_id

      t.timestamps
    end
  end
end
