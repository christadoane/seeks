Rails.application.routes.draw do
  get 'likes/index'

  get 'likes/new'

  get 'secrets' => 'secrets#index'

  get 'secrets/new'

  # sets when navigate to /users it will show index.html
  root "users#index"
  get 'sessions' => 'sessions#index'
  
  # shows users/new.html.erb for registering
  get 'users/new' => "users#new"
  #click register go to users/create method -> redirect to /sessions/new to login
  post "users" => "users#create"
  # shows sessions/new.html.erb for logging in
  get 'sessions/new' => "sessions#new"

  # when click login go to sessions/create method -> redirect to /users/id
  post 'sessions' => "sessions#create"
  # when you click Log out button it sets session[:id] = nil

  delete 'sessions/:id' => "sessions#destroy"

  #this path will pull up /users/show.html.erb
  get 'users/:id' => 'users#show'
  # user clicks edit takes them to edit.html.erb page
  get 'users/:id/edit' => 'users#edit'

 
  # user clicks Update Profile calls users/update method redirect to /users/id
  patch 'users/:id' => 'users#update'
  # user clicks Delete Account calls users/destroy method redirect to /users/new
  delete 'users/:id' => "users#destroy"
  post "secrets" => "secrets#create"
  delete 'secrets/:id' => "secrets#destroy"

  post "likes" => "likes#create"

#not needed
  #get 'sessions' => 'sessions#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
