Rails.application.routes.draw do
  root "events#index"

  resources :users, only: %i[show edit update]
  resources :events
end
