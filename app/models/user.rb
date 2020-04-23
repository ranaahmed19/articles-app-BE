class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, :name, presence: true
  has_secure_password
  has_many :articles, dependent: :destroy
end
