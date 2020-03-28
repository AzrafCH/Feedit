class Post < ApplicationRecord
  belongs_to :user, optional: true, inverse_of: :post
  belongs_to :subfed, optional: true, inverse_of: :post
  has_many :forums, dependent: :destroy, inverse_of: :posts
  has_many :subfeds, through: :forums, dependent: :destroy, inverse_of: :posts
  has_many :users, through: :forums, dependent: :destroy, inverse_of: :posts
end
