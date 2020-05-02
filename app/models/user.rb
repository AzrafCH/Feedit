class User < ApplicationRecord
  require 'securerandom'

  has_secure_password
  has_many :settings
  has_many :subfeds
  accepts_nested_attributes_for :settings

  has_many :posts, foreign_key: :user_id, class_name: "Post", dependent: :destroy
  has_many :subfeds, through: :posts

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 5}

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

end
