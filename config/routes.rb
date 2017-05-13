Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root 'pages#home'
  get 'dashboard' => 'dashboards#index'

end
