ActionController::Routing::Routes.draw do |map|
  map.resources :years do |years|
    years.resources :people, :finishes
  end
  
  map.root :controller => :finishes, :year_id => Time.now.year
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
