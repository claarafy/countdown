class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_and_belongs_to_many :groups
end
