class Admin::UsersController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!
  before_action :load_users, only: [:destroy, :show, :edit, :update]
  before_action :verify_admin

  def index
    @q = User.search params[:q]
    @users = @q.result(distinct: true).all_except(current_user)
    respond_to do |format|
      format.html {
        @users = @users.page(params[:page]).per Settings.per_page
      }
      format.xlsx {send_data @users.to_xls,
        filename: generate_file_name(t("users_file_name"))}
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".create_success"
    else
      flash[:danger] = t ".create_fails"
    end
    redirect_to request.referer
  end

  def show
  end

  def edit
  end

	def update
    @user.role = params[:role]
    if @user.save
      flash[:success] = t ".you_save"
    else
      flash[:danger] = t ".you_fails"
    end
    redirect_to request.referer
  end

	def destroy
		if @user.destroy
			flash[:success] = t "admin.users.success_destroyed_user"
		else
			flash[:success] = t "admin.users.unsuccess_destroyed_user"
		end
		redirect_to admin_users_path
	end

	private
	def load_users
		@user = User.find_by id: params[:id]
		unless @user
			flash[:warning] = t "error_not_exits"
			redirect_to root_url
		end
	end

	def user_params
    params.require(:user).permit :name, :phone, :email, :password,
      :password_confirmation, :avatar
  end
end
