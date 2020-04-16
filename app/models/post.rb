class Post < ApplicationRecord
  validates :title, presence: true
  validates :summary, presence: true
  validates :subfed_id, presence: false


  belongs_to :subfed
  belongs_to :user

  has_many :comments, foreign_key: :post_id, class_name: "Comment", dependent: :destroy
  has_many :users, through: :comments
end
