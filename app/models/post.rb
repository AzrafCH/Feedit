class Post < ApplicationRecord
  belongs_to :subfed
  has_many :forums, dependent: :destroy
  has_many :subfeds, through: :forums
  has_many :users, through: :forums

  has_many :subfed_ids
  has_many :subfeds, through: :subfed_ids
  accepts_nested_attributes_for :subfed_ids
end
