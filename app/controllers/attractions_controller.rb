class AttractionsController < ApplicationController
  def new
    @attractions = Attraction.all
    @attraction = Attraction.find(params[:trip_id])
  end
end
