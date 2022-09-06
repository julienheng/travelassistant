class AttractionsController < ApplicationController
  def new
    @attractions = Attraction.all
    @trip = Trip.find(params[:trip_id])
    @attraction = Attraction.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @attraction = Attraction.new(attraction_params)
    @attraction.trip = @attraction
    if @attraction.save
      redirect_to trip_path(@attraction.trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :address, :price, :rating, :category_name, :booked, :selected, :trip_id)
  end
end
