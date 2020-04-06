class Post < ApplicationRecord
  belongs_to :subfed
  belongs_to :user
end
