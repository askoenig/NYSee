class SessionsController < ApplicationController

  def new
      @user = User.new
  end

  def create
    @user = User.find_by(user_name: params[:session][:user_name])
    # byebug
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:error] = "Invalid login, bitch"
        redirect_to new_session_path
      end
    end


  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end




end
