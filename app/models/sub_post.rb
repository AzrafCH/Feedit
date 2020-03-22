class SubPost < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :subfed, optional: true
end
