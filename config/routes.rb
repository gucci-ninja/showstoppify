Rails.application.routes.draw do
  root to: 'landing#index'
  get 'landing/test'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
