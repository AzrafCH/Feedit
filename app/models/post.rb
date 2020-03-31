class Post < ApplicationRecord
  belongs_to :subfed

  has_many :forums, dependent: :destroy
  has_many :subfeds, through: :forums
  has_many :users, through: :forums
end
