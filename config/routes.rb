Rails.application.routes.draw do
  resources :years do
    resources :people, :finishes
    resource :activity
    get 'reports' => "reports#index"
    get 'reports/:action', :controller => :reports
  end

  resources :reports, only: :index
  get 'reports/:action/:race_id', :controller => :reports

  # root 'finishes#index', year_id: Time.now.year
  root 'reports#index'
end
