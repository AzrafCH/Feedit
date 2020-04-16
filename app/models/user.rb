class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 5 }

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /@/

  validates :password, presence: true
  validates :password, length: { minimum: 1 }

  has_secure_password
  has_many :settings
  accepts_nested_attributes_for :settings

  has_many :posts, foreign_key: :user_id, class_name: "Post", dependent: :destroy
  has_many :subfeds, through: :posts

  has_many :comments, foreign_key: :user_id, class_name: "Comment", dependent: :destroy
  has_many :posts, through: :comments
end
