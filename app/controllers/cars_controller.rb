class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "Car has been successfully added."
    else
      flash[:error] = @car.errors.full_messages
    end

    redirect_to @car
  end

  def show
  end

  def edit
  end

  def update
    if @car.update(car_params)
      flash[:notice] = "Car has successfully been updated."
    else
      flash[:error] = @car.errors.full_messages
    end

    redirect_to @car
  end

  def destroy
    unless @car.destroy
      flash[:error] = @car.errors.messages
    end
    redirect_to cars_path
  end

  private
  def car_params
    params.require(:car).permit(:name, :description)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
