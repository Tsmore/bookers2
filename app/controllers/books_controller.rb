class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user_id
    @book = Book.save
    redirect_to users_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
