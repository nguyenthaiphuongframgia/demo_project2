class BooksController < ApplicationController
  include ApplicationHelper
  before_action :load_all_categories, :load_all_authors, :load_all_publishers
  before_action :load_book, except: [:create, :index, :new]

  def index
    @q = Book.search params[:q]
    @books = @q.result(distinct: true).page(params[:page]).per Settings.per_page
  end

  def show
  end

  private
  def load_all_categories
    @categories = Category.select "id, name"
  end

  def load_all_authors
    @authors = Author.select "id, name"
  end

  def load_all_publishers
    @publishers = Publisher.select "id, name"
  end

  def load_book
    @book = Book.find_by id: params[:id]
    render_404 unless @book
  end
end
