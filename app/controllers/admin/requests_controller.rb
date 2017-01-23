class Admin::RequestsController < ApplicationController
  before_action :verify_admin

  def index
    @requests = Request.by_status(params[:status])
  end

  def edit
    @request = Request.new
  end

  def update
    @request = Request.find_by id: params[:id]
    @request.status = params[:status]
    @user = User.find @request.user_id
    if @request.save
      case @request.status
      when 0
        flash[:success] = "You had choosed Pending"
      when 1
        flash[:success] = "You had choosed Approve"
        #UserMailer.orders_success(@user,"aprove").deliver_now
      else
        flash[:success] = "You had choosed Reject"
      end
      redirect_to :back
    else
      render :edit
    end
  end
end
