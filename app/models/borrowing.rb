class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # Scopes
  scope :current, -> { where(returned_at: nil) }

  validate :book_availability, on: :create

  private

  def book_availability
    errors.add(:book, "is not available") unless book.available?
  end
end
