Hay10k::Application.routes.draw do
  resources :years do
    resources :people, :finishes
    resource :activity
    get 'reports' => "reports#index"
    get 'reports/:action', :controller => :reports
  end

  root to: 'finishes#index', year_id: Time.now.year
end
