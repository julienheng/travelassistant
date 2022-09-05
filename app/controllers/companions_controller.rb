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
      redirect_to trip_loading_page_path(@companion.trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @companion = Companion.find(params[:id])
  end

  def add_field
    @trip = Trip.find(params[:trip_id])
    @companion = Companion.new

    respond_to do |format|
      format.text { render partial: "companions/add_field", locals: {trip: @trip, companion: @companion}, formats: [:html] }
    end
  end


  private

  def companion_params
    params.require(:companion).permit(:name, :age, :type)
  end
end
