class Book < ApplicationRecord
  validates :title, :author, :isbn, presence: true
  validates :isbn, uniqueness: true
  has_many :borrowings
  has_many :borrowers, through: :borrowings, source: :user

  def available?
    borrowings.where(returned_at: nil).none?
  end
end
