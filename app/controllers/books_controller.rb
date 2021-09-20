class BooksController < ApplicationController
  def index
    @books = Book.all
    @newbook = Book.new
  end

  def show
  end

  def edit
  end

  private
  def book_params
  end
end

