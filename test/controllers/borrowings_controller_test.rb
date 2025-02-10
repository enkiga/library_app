require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @book = books(:one)
    sign_in @user
  end

  test "should return book" do
    borrowing = Borrowing.create!(user: @user, book: @book)
    post return_borrowing_path(borrowing)
    assert_not_nil borrowing.reload.returned_at
    assert_redirected_to profile_path
  end

  test "should handle return error" do
    post return_borrowing_path(id: 999)
    assert_redirected_to profile_path
    assert_not_nil flash[:alert]
  end
end
