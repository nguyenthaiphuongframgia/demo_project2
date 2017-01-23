class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:update, :create]
  before_action :load_book

  def create
    current_user.like_book @book
    redirect_to request.referer
  end

  def destroy
    current_user.unlike_book @book
    redirect_to request.referer
  end

  private
  def load_book
    @book = Book.find_by id: params[:id]
  end
 end
