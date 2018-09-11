Rails.application.routes.draw do
  resources :adjustments, only: [:create]
end
