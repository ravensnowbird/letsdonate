Rails.application.routes.draw do
  ##get 'users/set_user_type'

  #devise_for :users

  root to: "home#index"

  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks"}


  #devise_for :users
  resources :transporters do
    get "transporter_dashboard"
    post "create_regions"
    resources :regions
  end
  resources :food_responces do
    get :transport_response
  end
  resources :regions
  resources :notifiers
  resources :ngos do
    get "responce/:resonse_id" => "food_responces#edit", :as => 'edit_food_responces'
    get "update_responce/:resonse_id" => "food_responces#update", :as => 'update_food_responce'
    get :responce
    post 'create_regions'
    resources :regions
  end
  resources :list_items
  resources :food_donors do
    get :find_ngos
    post :notification
  end
  get 'dashboard' => "users#dashboard"
  get 'ngo' => "users#ngo"
  resources :users do
    get 'set_user_type'
    get 'check_user_type'

  end
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
