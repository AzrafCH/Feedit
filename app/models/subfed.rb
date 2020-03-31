class Subfed < ApplicationRecord
  belongs_to :user

  has_many :forums, dependent: :destroy
  has_many :users, through: :forums
  has_many :posts, through: :forums
end
