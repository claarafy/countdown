Rails.application.routes.draw do

  root 'home#index'
  resources :users
#   users   GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
# new_user  GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#    user   GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy
  resources :posts
#   posts   GET    /posts(.:format)          posts#index
#           POST   /posts(.:format)          posts#create
# new_post  GET    /posts/new(.:format)      posts#new
# edit_post GET    /posts/:id/edit(.:format) posts#edit
#  post     GET    /posts/:id(.:format)      posts#show
#           PATCH  /posts/:id(.:format)      posts#update
#           PUT    /posts/:id(.:format)      posts#update
#           DELETE /posts/:id(.:format)      posts#destroy
  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]
#   logout  DELETE /logout(.:format)         sessions#destroy
# sessions  POST   /sessions(.:format)       sessions#create
# new_session GET    /sessions/new(.:format)   sessions#new
end
