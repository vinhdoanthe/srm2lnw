Rails.application.routes.draw do
  devise_for :users
  resources :words
  get 'today_words', to: 'words#today_words'
  get '/words/:id/flash_card', to: 'words#flash_card', as: 'flash_card'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "words#today_words"
end
