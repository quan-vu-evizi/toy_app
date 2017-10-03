# == Route Map
#
#      Prefix Verb   URI Pattern                 Controller#Action
#        root GET    /                           uploads#index
#        help GET    /help(.:format)             static_pages#help
#       about GET    /about(.:format)            static_pages#about
#     contact GET    /contact(.:format)          static_pages#contact
#      signup GET    /signup(.:format)           users#new
#       login GET    /login(.:format)            sessions#new
#             POST   /login(.:format)            sessions#create
#      logout DELETE /logout(.:format)           sessions#destroy
#       users GET    /users(.:format)            users#index
#             POST   /users(.:format)            users#create
#    new_user GET    /users/new(.:format)        users#new
#   edit_user GET    /users/:id/edit(.:format)   users#edit
#        user GET    /users/:id(.:format)        users#show
#             PATCH  /users/:id(.:format)        users#update
#             PUT    /users/:id(.:format)        users#update
#             DELETE /users/:id(.:format)        users#destroy
#     uploads GET    /uploads(.:format)          uploads#index
#             POST   /uploads(.:format)          uploads#create
#  new_upload GET    /uploads/new(.:format)      uploads#new
# edit_upload GET    /uploads/:id/edit(.:format) uploads#edit
#      upload GET    /uploads/:id(.:format)      uploads#show
#             PATCH  /uploads/:id(.:format)      uploads#update
#             PUT    /uploads/:id(.:format)      uploads#update
#             DELETE /uploads/:id(.:format)      uploads#destroy
# 

Rails.application.routes.draw do
  root :to => 'uploads#index'
  #root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get  '/listuploads', to: 'uploads#list'
  resources :users
  resources :uploads
end
