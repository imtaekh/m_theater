Rails.application.routes.draw do
  $TMDB_API_KEY = ENV["TMDB_API_KEY"]




  get 'show_times/create'


  root 'home#index'

  resources :movies
  get 'show_times/by_movie'=>'show_times#check_create_by_movie'
  post 'show_times/by_movie'=>'show_times#create_by_movie', as: :create_show_times_by_movie

  # get 'movies/index'
  # get 'movies/show'
  # get 'movies/new'
  # post 'movies'=>'movies#create', as: :create_movie
  # patch 'movies/:id'=>'movies#update', as: :update_movie
  # get 'movies/destroy'



  get 'admins/movies'
  get 'admins/show_times'
  get 'admins/manage'
  get 'admins/statistics'
  get 'admins/orders'

  get 'movies/index'
  get 'movies/show'
  get 'movies/create'
  get 'movies/update'
  get 'movies/destroy'

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
