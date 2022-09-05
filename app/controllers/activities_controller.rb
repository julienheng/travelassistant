class ActivitiesController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @activity = Activities.new
  end

  def create
    @trip = Trip.find(params[:trip_id])


  end
end
