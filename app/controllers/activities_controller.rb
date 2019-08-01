class ActivitiesController < AuthenticatedController
  def show
    # Facts
    @races = @year.races
  end
end
