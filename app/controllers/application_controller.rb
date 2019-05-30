class ApplicationController < ActionController::Base

  def require_login
    if session[:user_id] == nil
      redirect_to new_session_path
    end
  end

  def stay_in_your_lane
    @user = User.find(params[:id])
      unless session[:user_id] == @user.id
        flash[:error] = "You are not authorized to access that page, bitch"
        redirect_to new_session_path
      end
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end



end
