class BooksController < ApplicationController

  before_filter :auth_user, except: [:index, :show]

  def index
    @books = Book.page(params[:page] || 1).per_page(params[:per_page] || 10).
      order("id desc").where(is_public: true).includes(:tags, :user)
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_attrs)
    if @book.save
      flash[:notice] = "订单成功"
      redirect_to books_path
    else
      flash[:notice] = "订单创建失败"
      render action: :new
    end
  end

  def show
    @book = Book.find params[:id]
  end

  def edit
    @book = current_user.books.find params[:id]
    render action: :new
  end

  def update
    @book = current_user.books.find params[:id]
    @book.attributes = book_attrs
    if @book.save
      flash[:notice] = "订单更新成功"
      redirect_to books_path
    else
      flash[:notice] = "订单更新失败"
      render action: :new
    end
  end

  private
  def book_attrs
    params.require(:book).permit(:title, :content, :is_public, :tags_string)
  end

end