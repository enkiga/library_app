class User < ApplicationRecord
  has_secure_password

  # Associations
  has_many :borrowings, dependent: :destroy
  has_many :borrowed_books, through: :borrowings, source: :book

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
