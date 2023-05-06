Rails.application.routes.draw do
  resources :timetables
  resources :contests
  resources :notices

  Rails.application.routes.draw do
    post 'events/by_month', to: 'events#by_month'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
