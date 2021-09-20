class BooksController < ApplicationController
  # before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @books = Book.all
    @newbook = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
  end

  def create
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
      flash[:success] = "successfully"
      redirect_to books_path
    else
      render :index
    end
  end

  def edit
    @editbook = Book.find(params[:id])
  end

  def update
    @editbook = Book.find(params[:id])
    if @editbook.update(book_params)
      flash[:info] = "successfully"
      redirect_to book_path(@editbook)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end

