Rails.application.routes.draw do

  get 'welcome/home'

  get 'activities/most_popular', to: 'activities#most_popular'
  get 'locations/:id/new_activity', to: "locations#new_activity", as: "new_location_activity"

  resources :locations
  resources :categories
  resources :activities do
    resources :reviews
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
end
