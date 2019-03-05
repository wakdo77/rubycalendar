Rails.application.routes.draw do
  resource :calendar, only: [:show], controller: :calendar
  resources :events
  root to: "calendar#show"
  # get 'calendar/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
