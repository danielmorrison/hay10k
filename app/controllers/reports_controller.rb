class ReportsController < ApplicationController
  skip_before_filter :find_year
  before_filter :find_race, only: [:results, :numbers, :age_groups]

  def index
    @page_title = "Pickford Hay Days - Race Results"
    render layout: "application"
  end

  def results
    @page_title = "Pickford Hay Days - #{@race.year} #{@race.name} Results"
    # @people = @race.people.order("finishes.time IS NOT NULL, finishes.place").includes(:finishes)
    @finished = @race.people.where("finishes.time IS NOT NULL AND finishes.place IS NOT NULL").order("finishes.place").includes(:finishes)
    @not_finished = @race.people - @finished

    respond_to do |format|
      format.html
      format.txt
    end
  end

  def numbers
    @people = @race.people.order("number")
  end

  def age_groups
    @page_title = "Pickford Hay Days - #{@race.year} #{@race.name} Age Group Results"
    @age_groups = @race.age_groups.order("low, high, gender_id")
  end

  def map
    @race = Race.find :first
    @people = Person.all
  end

  def mailing
    year = Year.find_by_year(params[:id])
    @races = year.races.where("distance > 2").includes({people: :gender})
    respond_to do |format|
      format.html { render layout: false }
      format.csv do
        render type: "text/csv; charset=utf8; header=present",
               disposition: %(attachment; filename="mailing_list.csv")
      end
    end
  end

  private

  def find_race
    year = Year.find_by!(year: params[:year_id])
    @race = Race.find_by!(year: year, distance: params[:distance].to_i)
  end
end
