Rails.application.routes.draw do
  root :to => redirect('/reports')

  resources :email, only: [:create]
  resources :reports
end
