class AccommodationsController < ApplicationController

  def new
    @accommodations = Accommodation.all
    @accommodation = Accommodation.find(params[:trip_id])
  end

end
