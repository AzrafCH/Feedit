class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :subfed, optional: true
  has_many :forums, dependant: :destroy
  has_many :subfeds, through: :forums, dependant: :destroy
  has_many :users, through: :forums, dependant: :destroy
end
