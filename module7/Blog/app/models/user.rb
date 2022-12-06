class User < ApplicationRecord
  has_many :posts
  validates :email, presence: true, uniqueness: true
  validates :username, uniqueness: true, presence: true
end
