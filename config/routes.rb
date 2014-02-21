Rails.application.routes.draw do
  resources :transactions
  resource :upload, only: [:new, :create]
  root 'uploads#new'
end
