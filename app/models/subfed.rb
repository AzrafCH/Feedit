class Subfed < ApplicationRecord
  has_many :forums, dependent: :destroy
  has_many :users, through: :forums
  has_many :posts, through: :forums

end
