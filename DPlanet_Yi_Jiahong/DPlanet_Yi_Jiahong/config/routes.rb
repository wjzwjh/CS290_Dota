DotaPlanet::Application.routes.draw do


  resources :photos

  resources :galleries

  resources :locations

  get "video_store/index"

  resources :videos

  resources :orders

  resources :line_items

  resources :carts
  #resources :store
  resources :products

  get "store"  => 'store#index' , :as => 'store'
get "video_store"  => 'video_store#index' , :as => 'video_store'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    #delete 'logout' => :destroy
    delete 'logout' => :destroy
  end
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  #get "users/new"  => "users#new"  , :as => 'register'
  get 'users/register' => 'users#new'  , :as => 'register'
  get 'home' => 'users#index'  , :as => 'homepage'
  get 'users/login' => 'sessions#new'  , :as => 'login'
  get 'logout' => 'sessions#destroy'  , :as => 'logout'
  #post 'users' => 'users#create'  , :as => 'signIn'

    #resources :users do
    #  collection do
    #    get 'checkName'
    #  end
    #end
    get 'users/checkName' => 'users#checkName'  , :as => 'checkName'
    #map.check_email "users/check_email", :controller => "users", :action => "check_email"
    #map.resources :users
    resources :users

  root to: 'store#index', as: 'store'
#  map.root :controller => 'users'
#   params = { :controller => 'users' , :action =>'signUP'}
#users ':users/:signUP'

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
