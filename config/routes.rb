SpatialAccess::Application.routes.draw do

  resources :presentations

  resources :slides

  resources :presesntations

  get "home/index"
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"

  post "/htmltopdf/:id" => 'campaigns#htmltopdf'
  get "/get_content/:id" => 'campaigns#get_content', as: "get_content"
  get "/build_campaign/:id" => 'campaigns#build_campaign', as: "build_the_campaign"
  post "/import_content/:id" => 'campaigns#import_content', as: "import_content"

  get "/create_presentation" => 'presentations#create_presentation', as: "create_presentation"

  get "/menu/:id" => 'slides#menu'
  get "/menu_new/:id" => 'slides#menu_new'
  get "/get_image/:id" => 'slides#get_image'


  resources :clients
  resources :slots do
    collection { post :import }
  end
  resources :campaigns do
    collection { post :import }
  end

  root 'home#index'

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
