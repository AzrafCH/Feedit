class Subfed < ApplicationRecord
  belongs_to :user, optional: true
  has_many :forums
  has_many :users, through: :forums
  has_many :posts, through: :forums
end
