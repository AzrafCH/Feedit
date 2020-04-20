class User < ApplicationRecord
  require 'securerandom'

  has_secure_password
  has_many :settings
  accepts_nested_attributes_for :settings

  has_many :posts, foreign_key: :user_id, class_name: "Post", dependent: :destroy
  has_many :subfeds, through: :posts

  has_many :comments, foreign_key: :user_id, class_name: "Comment", dependent: :destroy
  has_many :posts, through: :comments

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 5}

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  def self.create_by_omniauth(auth)
    @user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
    @user.email = auth[:info][:email]
    @user.password = SecureRandom.hex
    @user.username = auth['info']['username']
    @user.image = auth['info']['image']
    if User.exists?(@user.id)
      @user
    else
      @user.save
    end
  end

end
