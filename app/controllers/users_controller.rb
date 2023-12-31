class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @users = User.page(params[:page])
    @user = current_user
    @book = Book.new
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated successfully'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
    @book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user == current_user
      redirect_to user_path(current_user)
    end
  end
end
