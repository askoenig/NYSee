class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
      unless session[:user_id] == @user.id
        flash[:error] = "You are not authorized to access that page, bitch"
        redirect_to new_session_path
      end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :user_name, :password, :email)
  end

end
