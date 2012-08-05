Dmarc::Application.routes.draw do
  root :to => 'pages#home'

  resources :email, only: [:create]
end
