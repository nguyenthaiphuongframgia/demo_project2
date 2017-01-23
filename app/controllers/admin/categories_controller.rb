class Admin::CategoriesController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!
  before_action :verify_admin
  before_action :load_category, except: [:create, :index, :new]

  def index
    @q = Author.search params[:q]
    @categories_all = @q.result(distinct: true)
    respond_to do |format|
      format.html {
        @categories = @categories_all.page(params[:page]).per Settings.per_page
      }
      format.xlsx {send_data @categories_all.to_xls,
        filename: generate_file_name(t ".categories_file_name")}
    end
  end

  def new
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".category_add_success"
      redirect_back fallback_location: admin_categories_path
    else
      render :new
    end
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".edit_category"
      render :edit
    else
      flash[:danger] = t ".edit_failed"
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_unsuccess"
    end
    redirect_back fallback_location: admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name, :description
  end

  def load_category
    @category = Category.find_by id: params[:id]
    render_404 unless @category
  end
end
