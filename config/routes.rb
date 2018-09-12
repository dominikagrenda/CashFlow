Rails.application.routes.draw do
  resources :adjustments, only: [:index, :create]
  get "/adjustment/index", to: "adjustments#index"
end
