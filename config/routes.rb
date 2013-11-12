Koordinosky::Application.routes.draw do


  resources :oferta

  resources :escenarios

  #root 'pages#index'
  get '/pages/index' => 'pages#index'
  root 'sessions#new'
  ################# SESSIONES
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'estudiantes#new',      via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  #################
  resources :pensums
  
  resources :validas

  resources :cursadas

  resources :cursos do
	  collection do
		get 'seleccionar'
	  end
	end

  resources :plans do
    collection do
    get 'eliminar'
    end
  end

  resources :programas

  resources :estudiantes do
	  collection do
		get 'seleccionar'
	  end
	end

  get '/optimizador/showEscenario' => 'optimizador#showEscenario'
  post '/optimizador/showEscenario' => 'optimizador#showEscenario'

  get '/optimizador/guardarUltimoEscenario' => 'optimizador#guardarUltimoEscenario'
  post '/optimizador/guardarUltimoEscenario' => 'optimizador#guardarUltimoEscenario'

  get '/optimizador/setMinimo' => 'optimizador#setMinimo'
  post '/optimizador/setMinimo' => 'optimizador#setMinimo'

  get '/optimizador/setMaximo' => 'optimizador#setMaximo'
  post '/optimizador/setMaximo' => 'optimizador#setMaximo'
  
  get '/optimizador/estadisticas' => 'optimizador#estadisticas'
  post '/optimizador/estadisticas' => 'optimizador#estadisticas'

  get '/optimizador/sugerirSemestre' => 'optimizador#sugerirSemestre'
  post '/optimizador/sugerirSemestre' => 'optimizador#sugerirSemestre'
	  
  get '/optimizador/asignacionCupos' => 'optimizador#asignacionCupos'
  post '/optimizador/asignacionCupos' => 'optimizador#asignacionCupos'

  get '/optimizador/sugerirOferta' => 'optimizador#sugerirOferta'
  post '/optimizador/sugerirOferta' => 'optimizador#sugerirOferta'
  
  
  get '/optimizador/demanda' => 'optimizador#calcularDemandaTodos'
  post '/optimizador/demanda' => 'optimizador#calcularDemandaTodos'

  get '/optimizador/eliminarOferta' => 'optimizador#eliminarOferta'
  post '/optimizador/eliminarOferta' => 'optimizador#eliminarOferta'
    
  get '/optimizador/agregarOferta' => 'optimizador#agregarOferta'
  post '/optimizador/agregarOferta' => 'optimizador#agregarOferta' 
    
  get '/optimizador/agregarCupo' => 'optimizador#agregarCupo'
  post '/optimizador/agregarCupo' => 'optimizador#agregarCupo' 

  get '/optimizador/quitarCupo' => 'optimizador#quitarCupo'
  post '/optimizador/quitarCupo' => 'optimizador#quitarCupo'  

  get '/optimizador/ultimaOferta' => 'optimizador#ultimaOferta'
  post '/optimizador/ultimaOferta' => 'optimizador#ultimaOferta'

  get ':action' => 'pages'
  post ':action' => 'pages'

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
