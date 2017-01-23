class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_users, only: [:show]

  def index
    @users = User.all.page(params[:page]).per Settings.per_page
  end

  def show
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render "show_follow"
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render "show_follow"
  end

  private
  def load_users
    @user = User.find_by id: params[:id]
    unless @user
      flash[:warning] = t "error_not_exits"
      redirect_to root_url
    end
  end
end
