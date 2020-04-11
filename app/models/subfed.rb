class Subfed < ApplicationRecord
  has_many :posts, foreign_key: :subfed_id, class_name: "Post", dependent: :destroy
  has_many :users, through: :posts
end
