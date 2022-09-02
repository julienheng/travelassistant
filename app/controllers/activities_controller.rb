class ActivitiesController < ApplicationController
  def new
    @attraction = Attraction.new
  end
end
