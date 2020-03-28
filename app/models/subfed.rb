class Subfed < ApplicationRecord
  belongs_to :user, optional: true, inverse_of: :subfed
  has_many :forums, dependent: :destroy, inverse_of: :subfeds
  has_many :users, through: :forums, dependent: :destroy, inverse_of: :subfeds
  has_many :posts, through: :forums, dependent: :destroy, inverse_of: :subfeds
end
