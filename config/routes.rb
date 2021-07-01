Rails.application.routes.draw do
  resources :events
  devise_for :users
  root "events#index"
  get 'users/:id' => 'users#show', via: :get, as: :users_show
  resources :event_attendances
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
