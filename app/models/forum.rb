class Forum < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :post, class_name: "Post"
  belongs_to :subfed, class_name: "Subfed"
end
