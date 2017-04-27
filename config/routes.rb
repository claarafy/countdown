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

  resources :groups do
    resources :posts
  end
#   groups  GET    /groups(.:format)          groups#index
#           POST   /groups(.:format)          groups#create
# new_group GET    /groups/new(.:format)      groups#new
# edit_group GET    /groups/:id/edit(.:format) groups#edit
#  group    GET    /groups/:id(.:format)      groups#show
#           PATCH  /groups/:id(.:format)      groups#update
#           PUT    /groups/:id(.:format)      groups#update
#           DELETE /groups/:id(.:format)      groups#destroy

# group_posts     GET    /groups/:group_id/posts(.:format)          posts#index
#                 POST   /groups/:group_id/posts(.:format)          posts#create
#  new_group_post GET    /groups/:group_id/posts/new(.:format)      posts#new
# edit_group_post GET    /groups/:group_id/posts/:id/edit(.:format) posts#edit
#      group_post GET    /groups/:group_id/posts/:id(.:format)      posts#show
#                 PATCH  /groups/:group_id/posts/:id(.:format)      posts#update
#                 PUT    /groups/:group_id/posts/:id(.:format)      posts#update
#                 DELETE /groups/:group_id/posts/:id(.:format)      posts#destroy



  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]
#   logout  DELETE /logout(.:format)         sessions#destroy
# sessions  POST   /sessions(.:format)       sessions#create
# new_session GET    /sessions/new(.:format)   sessions#new
end
