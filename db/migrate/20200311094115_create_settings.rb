class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|

      t.belongs_to :user
      t.string :bio
      t.string :age
      t.string :location

      t.timestamps
    end
  end
end
