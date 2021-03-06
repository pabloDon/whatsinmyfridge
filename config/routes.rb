Whatsinmyfridge::Application.routes.draw do
  get "favorites/switch"

  get "comments/create"

  root :to => 'static#index'
  
  match 'hola' => "user_sessions#new", :as => :login
  match 'adios' => "user_sessions#destroy", :as => :logout
  match 'chefs' => 'users#index', :as => :show_chefs
  match 'chef/:nick' => 'users#show', :as => :show_chef
  match 'public-profile' => 'users#public_profile', :as => :public_profile
  match 'my-recipes' => 'users#favorite_recipes', :as => :favorite_recipes
  match 'search' => 'recipes#search', :as => :search_recipes
  match 'cuisine' => 'users#edit', :as => :profile
  
  match 'create_comment/:recipe' => 'comments#create', :as => :create_comment
  match 'switch_favorite/:recipe' => 'favorites#switch', :as => :favorite_recipe
  
  resources :recipes
  resources :allergies
  resource :account, :controller => "users"
  resource :user_session
  resources :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
