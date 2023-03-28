class BooksController < ApplicationController
  def index
    @user = current_user
    @books = Book.all
  end

  def show
    @user = @book.user
  end

  def edit
  end
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end


  private
  
    def book_params
      params.require(:book).permit(:title, :body)
    end

end