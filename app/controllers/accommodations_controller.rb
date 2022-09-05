class AccommodationsController < ApplicationController

  def new
    @accommodations = Accommodation.all
    @accommodation = Accommodation.find(params[:trip_id])
    @accommodation = Accommodation.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @accommodation = Accommodation.new(accommodation_params)
    @accommodation.trip = @trip
    if @accommodation.save
      redirect_to trip_path(@accommodation.trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:entity_id, :hotel_id, :name, :price, :latitude, :longitude, :cheapest_partner, :stars, :hero_image, :value, :description, :booked, :selected, :trip_id)
  end

end
