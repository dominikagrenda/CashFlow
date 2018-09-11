Rails.application.routes.draw do
  resources :adjustments, only: [:create]
  get "/adjustment/total_expense", to: "adjustments#count_expenses"
  get "/adjustment/total_income", to: "adjustments#count_income"
end
