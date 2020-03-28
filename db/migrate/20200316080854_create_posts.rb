class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :summary
      t.integer :post_id

      t.timestamps
    end
  end
end
