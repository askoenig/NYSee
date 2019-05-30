class CustomVisitsController < ApplicationController

  def new
    @custom_visit = CustomVisit.new
  end

  def show
    @custom_visit = CustomVisit.find(params[:id])
      unless session[:user_id] == @custom_visit.user_id
        flash[:error] = "You are not authorized to access that page."
        redirect_to new_session_path
      end
  end

  def create
    @custom_visit = CustomVisit.create(user_id: current_user.id, custom_destination_id: custom_visit_params[:custom_destination_id])
    redirect_to user_path(@visit.user_id)
  end

private

  def custom_visit_params
    params.require(:visit).permit(:user_id, :custom_destination_id)
  end

end
