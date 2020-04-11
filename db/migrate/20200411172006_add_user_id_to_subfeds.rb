class AddUserIdToSubfeds < ActiveRecord::Migration[5.0]
  def change
    add_column :subfeds, :user_id, :integer
  end
end
