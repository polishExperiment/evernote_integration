Rails.application.routes.draw do
  devise_for :users

  root to: "dashboard#index"

  get "/auth/:provider/callback" => "omni_auth#callback"
  get "/auth/failure" => "omni_auth#failure"
  
  resources :notebooks, only: :index do
    resources :notes
  end
end
