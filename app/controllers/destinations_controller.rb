class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
  end

  def new
    @destination = Destination.new
  end

  def show
    @destination = Destination.find(params[:id])
  end



  private

  def destination_params
    params.require(:destination).permit(:name, :address, :destination_type, :year_created)
  end

end
