class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  before_filter :find_year
  
  
private  
  def find_year
    @year = Year.find_by_year!(params[:year_id])
  end
  protect_from_forgery
end
