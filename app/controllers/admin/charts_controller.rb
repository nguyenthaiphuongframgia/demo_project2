class Admin::ChartsController < ApplicationController
  include ApplicationHelper
  def index
    @user = User.by_search_user params[:start_day], params[:end_day]
    @user_array = @user.group_by(&:group_by_user).map {|k,v| [k, v.length]}.sort
    @book = Book.by_search_book params[:start_day], params[:end_day]
    @book_array = @book.group_by(&:group_by_book).map {|k,v| [k, v.length]}.sort
  end
end
