class User < ApplicationRecord
  has_secure_password
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :posts, dependent: :destroy
end
