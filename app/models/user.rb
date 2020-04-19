class User < ApplicationRecord
  validates :username,
            :presence => {:message => 'Username cannot be blank'},
            :uniqueness => {:message => 'Username already exists'},
            :length => { :minimum => 5, :message => 'Username must be more than 5 characters'}

  validates :email,
            :presence => {:message => 'Email cannot be blank'},
            :uniqueness => {:message => 'Email already exists'}

  validates :password,
            :presence => {:message => 'Password cannot be blank'},
            :length => {:minimum => 1, :message => 'Password most contain one or more characters'}

#  validates :username, presence: true, :message => 'please provide a valid username'
#  validates :username, uniqueness: true
#  validates :username, length: { minimum: 5 }, :message => 'please provide a username with 5 or more characters'
#
#  validates :email, presence: true, :message => 'please provide a valid email adress containing @'
#  validates :email, uniqueness: true
#  validates_format_of :email, :with => /@/

#  validates :password, presence: true, :message => 'please provide a valid password with 1 characters or more'
#  validates :password, length: { minimum: 1 }

  has_secure_password
  has_many :settings
  accepts_nested_attributes_for :settings

  has_many :posts, foreign_key: :user_id, class_name: "Post", dependent: :destroy
  has_many :subfeds, through: :posts

  has_many :comments, foreign_key: :user_id, class_name: "Comment", dependent: :destroy
  has_many :posts, through: :comments
end
