class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :delete_all
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
