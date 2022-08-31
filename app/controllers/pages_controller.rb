class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def new
    if current_page?(new_trip_path)
      render 'trips/new_second'
    end
  end
end
