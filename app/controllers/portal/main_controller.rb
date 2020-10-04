class  Portal::MainController < ApplicationController
  before_action :set_car, only: [:show]

  def index    
    @cars = Car.all.page(params[:page]).per(8) 
  end

  def show
  end

  def reserved_cars    
    binding.pry    
  end

  private 

  def set_car 
    @car = Car.find(params[:id])
    @reserved_car = ReservedCar.new
  end

  def reserved_params
    params.require(:car).permit(:car_id, :document)
  end

end
