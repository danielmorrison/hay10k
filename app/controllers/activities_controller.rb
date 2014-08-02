class ActivitiesController < ApplicationController
  def show
    # Facts
    @races = @year.races
  end
end