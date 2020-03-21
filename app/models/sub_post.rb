class SubPost < ApplicationRecord
  belongs_to :post
  belongs_to :subfed
end
