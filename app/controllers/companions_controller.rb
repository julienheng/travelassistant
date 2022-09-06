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

    respond_to do |format|
      if @companion.save
        format.html { redirect_to trip_loading_page_path(@companion.trip) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end

      format.json # views/companions/create.json.jbuilder
    end
  end


  def show
    @trip = Trip.find(params[:trip_id])
    @companion = Companion.find(params[:id])
  end

  # def add_field
  #   @trip = Trip.find(params[:trip_id])
  #   @companion = Companion.new

  #   respond_to do |format|
  #     if @companion.save
  #       format.html { redirect_to new_trip_companion_path(@companion.trip) }
  #       format.json
  #     else
  #       format.html { render "companions/new", status: :unprocessable_entity }
  #       format.json
  #     # format.text {
  #     #   render partial: "companions/add_field", locals: { trip: @trip, companion: @companion }, formats: [:html]
  #     # }
  #     end
  #   end
  # end

  private

  def companion_params
    params.require(:companion).permit(:name, :age, :type)
  end
end
