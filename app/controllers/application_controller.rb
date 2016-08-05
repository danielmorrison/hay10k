class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ENV["AUTH_USERNAME"], password: ENV["AUTH_PASSWORD"]

  config.relative_url_root = "" # see https://github.com/rails/rails/issues/9619

  helper :all # include all helpers, all the time

  before_action :find_year

  protect_from_forgery

private
  def find_year
    @year = Year.find_by!(year: params[:year_id])
  end
end
