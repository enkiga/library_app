class BorrowingsController < ApplicationController
  def return
    borrowing = current_user.borrowings.find(params[:id])
    borrowing.update!(returned_at: Time.current)
    redirect_to profile_path, notice: "Book returned!"
  rescue ActiveRecord::RecordNotFound
    redirect_to profile_path, alert: "Borrowing not found."
  end
end
