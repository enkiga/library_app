require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @book = books(:one)
  end

  test "should borrow book" do
    sign_in @user
    assert_difference("Borrowing.count") do
      post borrow_book_path(@book)
    end
    assert_redirected_to book_path(@book)
  end

  test "should prevent unauthorized borrowing" do
    post borrow_book_path(@book)
    assert_redirected_to login_path
  end
end
