Rails.application.routes.draw do
  root "users#index"
    

  resources :articles do
    resources :comments
  end 
  get "/one" , to: "users#one"

   resources :users 
  #   resources :articles
  # end
   get "/show", to: "users#show"
   get "/new" , to: "articles#new"
   get "/index", to: "users#index"
end
 