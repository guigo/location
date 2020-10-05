class Portal::ReservedCarsController < ApplicationController
  before_action :set_car, only: [:show]

  def show
  end

  def create        
    @reserved_car = ReservedCar.new(reservated_cars_params)

    respond_to do |format|
      if @reserved_car .save
        format.html { redirect_to  root_path, notice: 'Reserva criada com sucesso.' }
        format.json { render :show, status: :created, location: @reserved_car }
      else
        format.html { render :show }
        format.json { render json: @reserved_car.errors, status: :unprocessable_entity }
      end
    end
  end

  def days_reserved       
    reservations= ReservedCar.where(car_id: params[:car_id])
    days_reserved = []

    reservations.each do |reservation|            
      days_reserved  << (reservation.start_at.to_date..reservation.and_at.to_date).to_a
    end    

    render json: days_reserved
  end

  private 

  def set_car 
    @car = Car.find(params[:id])  
    @reserved_car = ReservedCar.new
  end

  def reservated_cars_params
    params.require(:reserved_car).permit(:car_id, :user_id, :document, :start_at, :and_at)
  end

end
