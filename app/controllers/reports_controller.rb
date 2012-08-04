class ReportsController < ApplicationController
  skip_before_filter :find_year
  
  def index
    render :layout => 'application'
  end
  
  def race
    @race = Race.find(params[:id])
    @people = @race.people.order("finishes.time IS NOT NULL, finishes.place").includes(:finishes)
    
    respond_to do |format|
      format.html
      format.txt
    end
  end
  
  def numbers
    @race = Race.find(params[:id])
    @people = @race.people.order('number')
  end
  
  def age_groups
    @race = Race.find(params[:id])
    @age_groups = @race.age_groups.order('low, high, gender_id')
  end
  
  def map
    @race = Race.find :first
    @people = Person.all
  end
  
  def mailing
    year = Year.find_by_year(params[:id])
    @races = year.races.where('distance > 2').includes({:people => :gender})
    respond_to do |format|
      format.html { render :layout => false }
      format.csv do
        render :type => 'text/csv; charset=utf8; header=present',
          :disposition => %|attachment; filename="mailing_list.csv"|
      end
    end
  end
end
