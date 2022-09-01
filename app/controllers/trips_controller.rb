class TripsController < ApplicationController
  def index
    @trips = Trip.all
    @companions = Companion.all
  end

  def new
    @companion = Companion.new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip = Trip.update(trip_params)
    redirect_to trip_path(@trip)
  end

  def destroy
    @trip = Trip.destroy
    redirect_to trips_path, status: :see_other
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :location,
                                 :budget, :total_cost, :latitude,
                                 :longitude, :currency, :pax)
  end
end
