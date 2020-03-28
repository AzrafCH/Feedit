class CreateSubfeds < ActiveRecord::Migration[5.0]
  def change
    create_table :subfeds do |t|
      t.string :title
      t.string :content
      t.integer :subfed_id

      t.timestamps
    end
  end
end
