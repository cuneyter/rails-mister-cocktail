Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: %i[index show new create] do
    resources :doses, only: %i[create]
    resources :reviews, only: %i[create]
  end
  resources :doses, only: %i[destroy]
end
