class Admin::CarsController < AdminController
  before_action :set_car, only: [:show, :edit, :update, :destroy]  

  def index
    @cars = Car.all.page(params[:page]).per(8) 
  end

  def show
  end

  def new
    @car = Car.new
  end  

  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to admin_cars_path, notice: 'Carro cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to admin_cars_path, notice: 'Carro atualizo com sucesso.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy   
    @car.destroy
    respond_to do |format|
      format.html { redirect_to admin_cars_path, notice: 'Carro removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private 

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:description, :model, :brand, :board, :model_year, :year_manufacture, :image)
  end
end
