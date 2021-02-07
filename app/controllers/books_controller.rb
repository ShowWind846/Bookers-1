class BooksController < ApplicationController

  def home
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end


# 編集機能 ----------------------------------------
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to "/books/#{@book.id}"
    else
      flash.now[:alert] = "ERROR"
      render :edit
    end
  end

# 投稿機能 ----------------------------------------
  def new
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book was successfully created."
      redirect_to "/books/#{@book.id}"
    else
      flash.now[:alert] = "ERROR"
      render :index
    end
  end

# 削除機能 ----------------------------------------
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success] = "Book was successfully destroyed."
    redirect_to '/books'
  end

# ストロングパラメータ ----------------------------
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
