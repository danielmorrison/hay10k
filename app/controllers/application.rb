# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  before_filter :find_year
  
  
private  
  def find_year
    @year = Year.find_by_year(params[:year_id])
  end
end
