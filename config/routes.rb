Rails.application.routes.draw do
  resources :nomination_lists
  resources :movies
  root to: 'landing#index'
  get 'landing/test'
  # get 'nomination_list/index'
  # patch 'nomination_list/update'
  # resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
