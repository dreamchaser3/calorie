Rails.application.routes.draw do

  devise_for :users,  :controllers => {
    :registrations => "users/registrations",
    :sessions =>"users/sessions",
    :passwords =>"users/passwords",
    :confirmations =>"users/confirmations",}

  get 'home/index'
  root 'home#index'
  get 'home/friends' => 'home#friends'
  get 'home/board/:id' => 'home#board'
  
  get '/do_friend' => 'home#do_friend'
  post '/change_profile_img' => 'home#change_profile_img'
  post '/change_background_img' => 'home#change_background_img'
  post '/write_post/:category' => 'home#write_post'
  post '/make_friend/:friend_id'=>'home#make_friend'
  post '/write_reply' => 'home#write_reply'
  post '/make_friend2/:touser_id/:user_id' =>'home#make_friend2'
  post '/bemyfr/:user_id/:touser_id'=>'home#bemyfr'
  post '/bemyfr2/:user_id/:touser_id'=>'home#bemyfr2'
  post '/bemyfr3/:user_id/:touser_id'=>'home#bemyfr3'
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
