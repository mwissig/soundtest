Rails.application.routes.draw do

  get 'songs' => 'songs#index'
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :songs


end
