Rails.application.routes.draw do
  resources :resumes, :only => [:edit, :new, :create, :index, :show, :update]

  resources :users, :only => [:edit, :new, :create, :index, :show, :update]
  
  resources :interests, :only => [:edit, :new, :create, :index, :show, :update]
  
  resources :languages, :only => [:edit, :new, :create, :index, :show, :update]

  resources :skilltypes, :only => [:edit, :new, :create, :index, :show, :update] do
    resources :skills, :only => [:edit, :new, :create, :update]
  end

  resources :employments, :only => [:edit, :new, :create, :index, :show, :update] do
    resources :positions, :only => [:edit, :new, :create, :index, :show, :update] do
      resources :responsibilities, :only => [:edit, :new, :create, :index, :show, :update]
    end
  end

  resources :positions, :only => [:edit, :new, :create, :index, :show, :update] do
    resources :responsibilities, :only => [:edit, :new, :create, :index, :show, :update]
  end

  resources :educations, :only => [:edit, :new, :create, :index, :show, :update] do
    resources :degrees, :only => [:edit, :new, :create, :update]
    resources :achievements, :only => [:edit, :new, :create, :update]
  end


  get '/', to: 'users#index'
  get '/login', to: 'users#index'
  post '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
  get '/register', to: 'users#new'
  get '/profile', to: 'users#profile'
  get '/profile/edit', to: 'users#profileEdit'
  
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
