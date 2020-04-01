class Subfed < ApplicationRecord

  has_many :forums, foreign_key: :subfed_id, class_name: "Forum", dependent: :destroy
  has_many :users, through: :forums
  has_many :posts, through: :forums
end
