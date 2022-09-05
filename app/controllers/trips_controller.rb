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
      redirect_to new_trip_companion_path
      # redirect_to generate_page_path
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

  def activities
    @trip = Trip.find(params[:id])

    @attractions = Attraction.all
    @trip = Trip.find(params[:id])
    @attraction = Attraction.new

    @restaurants = Restaurant.all
    @trip = Trip.find(params[:id])
    @restaurant = Restaurant.new

    # @attractions_api_data = sessions
    # @restaurants_api_data = sessions

    # render views/trips/activities
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :origin, :destination,
                                 :budget, :total_cost, :latitude,
                                 :longitude, :currency, :pax)
  end
end
