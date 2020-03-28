class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :subfed, optional: true
  has_many :forums, dependent: :destroy, inverse_of: :posts
  has_many :subfeds, through: :forums, dependent: :destroy
  has_many :users, through: :forums, dependent: :destroy
end
