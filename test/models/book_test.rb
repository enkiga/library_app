require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "valid book" do
    book = Book.new(title: "Test", author: "Author", isbn: "123")
    assert book.valid?
  end

  test "invalid without title" do
    book = Book.new(author: "Author", isbn: "123")
    assert_not book.valid?
  end
end
