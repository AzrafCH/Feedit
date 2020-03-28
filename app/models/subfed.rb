class Subfed < ApplicationRecord
  has_many :forums, dependent: :destroy
  has_many :users, through: :forums, dependent: :destroy
  has_many :posts, through: :forums, dependent: :destroy
end
