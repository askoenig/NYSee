class CustomDestinationsController < ApplicationController

  def new
    @custom_destination = CustomDestination.new
  end

  def show
    @custom_destination = CustomDestination.find(params[:id])
  end

  def create
    @custom_destination = CustomDestination.create(custom_destination_params)
    CustomVisit.create(custom_destination_id: @custom_destination.id, user_id: session[:user_id])
    redirect_to user_path(session[:user_id])
  end

  private

  def custom_destination_params
    params.require(:custom_destination).permit(:name, :address, :year_created, :destination_type)
  end

end
