class  Portal::MainController < ApplicationController  

  def index    
    @cars = Car.all.page(params[:page]).per(8) 
  end
end
