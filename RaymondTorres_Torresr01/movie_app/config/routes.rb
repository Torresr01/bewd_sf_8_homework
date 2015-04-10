Rails.application.routes.draw do
  get 'movies/search'

  root 'movies#index'

  resources :movies

end
