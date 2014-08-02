Hay10k::Application.routes.draw do
  resources :years do
    resources :people, :finishes
    resource :activity
    match 'reports', :controller => :reports, :action => 'index'
    match 'reports/:action', :controller => :reports
  end
  
  root :to => 'finishes#index', :year_id => Time.now.year
end
