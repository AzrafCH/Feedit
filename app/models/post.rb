class Post < ApplicationRecord
  has_many :forums, dependent: :destroy
  has_many :subfeds, through: :forums, dependent: :destroy
  has_many :users, through: :forums, dependent: :destroy
end
