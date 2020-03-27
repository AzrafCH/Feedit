class Subfed < ApplicationRecord
  belongs_to :user, optional: true
  has_many :forums, dependant: :destroy
  has_many :users, through: :forums, dependant: :destroy
  has_many :posts, through: :forums, dependant: :destroy
end
