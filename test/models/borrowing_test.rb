require "test_helper"

class BorrowingTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @book = books(:one)
  end

  test "should create valid borrowing" do
    borrowing = Borrowing.new(
      user: @user,
      book: @book,
      due_date: 2.weeks.from_now
    )
    assert borrowing.valid?
  end

  test "should prevent duplicate active borrowings" do
    Borrowing.create!(user: @user, book: @book, due_date: 2.weeks.from_now)
    borrowing = Borrowing.new(user: @user, book: @book)
    assert_not borrowing.valid?
    assert_includes borrowing.errors[:book], "is not available"
  end

  test "should set default due date" do
    borrowing = Borrowing.create!(user: @user, book: @book)
    assert_in_delta 2.weeks.from_now, borrowing.due_date, 1.second
  end
end
