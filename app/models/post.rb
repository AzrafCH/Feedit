class Post < ApplicationRecord
  belongs_to :subfed
  belongs_to :user

  has_many :comments

  validates :title, presence: true
  validates :summary, presence: true
end
