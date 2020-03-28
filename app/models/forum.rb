class Forum < ApplicationRecord
  belongs_to :user, inverse_of: :forum
  belongs_to :post, inverse_of: :forum
  belongs_to :subfed, inverse_of: :forum
end
