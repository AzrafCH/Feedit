class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :forums
  has_many :subfeds, through: :forums
  has_many :users, through: :forums
end
