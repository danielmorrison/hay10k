class ReportsController < ApplicationController
  skip_before_filter :find_race
  
  def race
    @race = Race.find(params[:id])
    @people = @race.people.find(:all, :order => "finishes.place", :include => :finishes)
    
  end
  
  def numbers
    @race = Race.find(params[:id])
    @people = @race.people.all(:order => 'number')
  end
  
  def age_groups
    @race = Race.find(params[:id])
    @age_groups = @race.age_groups.find(:all, :order => 'low, high, gender_id')
  end
  
  def map
    @race = Race.find :first
    @people = Person.find(:all)
  end
  
  def mailing
    year = Year.find_by_year(params[:id])
    @races = year.races.find(:all, :include => {:people => :gender})
    respond_to do |format|
      format.html { render :layout => false }
      format.csv do
        render :type => 'text/csv; charset=utf8; header=present',
          :disposition => %|attachment; filename="mailing_list.csv"|
      end
    end
  end
end
