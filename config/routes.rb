Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'forecasts/search_result'
  post 'forecasts/search_result', to: 'forecasts#search'
  get 'forecasts/previous_forecasts'
  get 'forecasts/user_searches'

  root to: 'forecasts#show_search'
end
