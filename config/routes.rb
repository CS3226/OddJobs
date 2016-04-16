Rails.application.routes.draw do

  # categories-related routes
  get '/categories', to: redirect('/')
  get '/categories/new', to: redirect('/')
  post '/categories', to: redirect('/')
  get '/categories/:id', to: redirect('/')
  get '/categories/:id/edit', to: redirect('/')
  put '/categories/:id', to: redirect('/')
  delete '/categories/:id', to: redirect('/')
  resources :categories

  # users-related routes
  get '/users', to: redirect('/')
  get '/users/new', to: redirect('/')
  # post '/users', to: redirect('/')
  # /users/:id and /users/:id/edit are handled by controller
  # put '/users/:id', to: redirect('/')
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users

  # listings-related routes
  get '/listings', to: redirect('/')
  # /listings/new is handled by controller
  # must check whether post and put are security concern
  get '/listings/category/:category', to: 'listings#index'
  resources :listings do
    resources :job_applications
  end

  # job_applications-related routes
  get '/job_applications', to: redirect('/')
  get '/job_applications/new', to: redirect('/')
  # must check whether post and put are security concern
  get '/job_applications/:id', to: redirect('/')
  get '/job_applications/:id/edit', to: redirect('/')
  # /job_application/:id and :id/edit are handled by controller, BUT NOT YET IMPLEMENTED
  resources :job_applications do
    resources :notifications
  end

  # notifications-related routes
  get '/notifications', to: redirect('/')
  get '/notifications/new', to: redirect('/')
  get '/notifications/:id', to:  redirect('/')
  get '/notifications/:id/edit', to:  redirect('/')
  resources :notifications

  root 'listings#index'
  
  # redirects everything else to root
  get '*path', to: redirect('/')

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
