class Post < ApplicationRecord
  has_many :sub_posts
  has_many :subfeds, through: :sub_posts
  belongs_to :users,   optional: true
end
