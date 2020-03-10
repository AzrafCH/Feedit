class User < ApplicationRecord
  has_secure_password
  has_many :settings
  accepts_nested_attributes_for :settings
end
