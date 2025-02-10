class BooksController < ApplicationController
  before_action :set_book, only: [ :show, :borrow ]

  def index
    @books = Book.all
  end

  def show; end

  def borrow
    if current_user
      @borrowing = current_user.borrowings.new(book: @book, due_date: 2.weeks.from_now)
      if @borrowing.save
        redirect_to @book, notice: "Book borrowed!"
      else
        redirect_to @book, alert: "Could not borrow book."
      end
    else
      redirect_to login_path, alert: "Please login first."
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
