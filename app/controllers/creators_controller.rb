class CreatorsController < ApplicationController

  def show
    @creator = Creator.new
  end

  def index
    @creators = Creator.all
  end

  
end
