class Subfed < ApplicationRecord
  belongs_to :user, optional: true
  has_many :sub_posts
  has_many :posts, through: :sub_posts
end
