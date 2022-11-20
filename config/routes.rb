Rails.application.routes.draw do
  get 'calc/input'
  get 'calc/view'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: redirect('/calc/input')
  # Defines the root path route ("/")
  # root "articles#index"
end
