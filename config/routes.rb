Rails.application.routes.draw do
  resources :years do
    resources :people, :finishes
    resource :activity
    get 'reports' => "reports#index"
    get 'reports/:action', :controller => :reports
  end

  root 'finishes#index', year_id: Time.now.year
end
