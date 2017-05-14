Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root 'pages#home'
  get 'dashboard' => 'dashboards#index'

  get 'dashboard/projects' => 'dashboards#projects'
  resources :projects
  resources :accounts
  resources :reviews
  resources :issues


  resources :accounts do
    member do
      get :sync_reviews
    end
  end

   resources :projects do
    member do
      get :sync_issues
    end
  end
end
