class CompanionsController < ApplicationController
  def index
    @companions = Companion.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @companion = Companion.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @companion = Companion.new(companion_params)
    @companion.trip = @trip
    if @companion.save
      redirect_to trip_path(@companion.trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @companion = Companion.find(params[:id])
  end

  private

  def companion_params
    params.require(:companion).permit(:name, :age, :type)
  end
end
