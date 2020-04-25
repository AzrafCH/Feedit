class Subfed < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  has_many :posts, foreign_key: :subfed_id, class_name: "Post", dependent: :destroy
  has_many :users, through: :posts

  scope :recent, -> (limit) { order("created_at desc").limit(limit) }
end
