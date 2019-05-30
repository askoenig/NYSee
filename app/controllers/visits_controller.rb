class VisitsController < ApplicationController

  def index
    @visits = current_user.visits.all
    @custom_visits = current_user.custom_visits.all
  end

  def new
    @visit = Visit.new
  end

  def show
    @visit = Visit.find(params[:id])
      unless session[:user_id] == @visit.user_id
        flash[:error] = "You are not authorized to access that page, bitch"
        redirect_to new_session_path
      end
  end

  def create
    @visit = Visit.create(user_id: current_user.id, destination_id: visit_params[:destination_id])
    redirect_to user_path(@visit.user_id)
  end

private

  def visit_params
    params.require(:visit).permit(:user_id, :destination_id)
  end

end
