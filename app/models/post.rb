class Post < ApplicationRecord
  belongs_to :subfed
  has_many :forums, foreign_key: :post_id, class_name: "Forum", dependent: :destroy
  has_many :subfeds, through: :forums
  has_many :users, through: :forums
end
