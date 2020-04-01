class Post < ApplicationRecord

  has_many :forums, foreign_key: :post_id, class_name: "Forum", dependent: :destroy
  has_many :subfeds, through: :forums
  has_many :users, through: :forums
end
