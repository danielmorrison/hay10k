ActionController::Routing::Routes.draw do |map|
  map.resources :years do |years|
    years.resources :people, :finishes
  end
  
  map.root :controller => :finishes, :year_id => Time.now.year
  
  map.connect 'years/:year_id/reports/:action', :controller => 'reports'
end
