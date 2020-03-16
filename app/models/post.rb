class Post < ApplicationRecord
  belongs_to :subfeds, optional: true
  belongs_to :users,   optional: true
end
