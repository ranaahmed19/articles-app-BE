class User < ApplicationRecord
  validate :username, presence: true, uniqueness: true
  validate :password, :email, :name, presence: true
  has_secure_password
  has_many: articles, dependent: :destroy
end
