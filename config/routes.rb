Rails.application.routes.draw do
  

  resources :sessions, only: [:create, :destroy]  
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
 
  get '/infos/:id' => 'projects#infos', as: :infos
  get '/notationA/:id' => 'projects#notationA', as: :notationA
  get '/notationI/:id' => 'projects#notationI', as: :notationI
  get '/soutenance/:id' => 'projects#soutenance', as: :soutenance
  get '/infos_soutenance/:id' => 'projects#infos_soutenance', as: :infos_soutenance
  get '/mesProjets' => 'gestion_projets#mesProjets', as: :mesProjets
  get '/responsable' => 'gestion_projets#responsable', as: :responsable
  get '/mesSoutenances' => 'gestion_projets#mesSoutenances', as: :mesSoutenances
  get '/admin_encadrants' => 'gestion_projets#admin_encadrants', as: :admin_encadrants
  get '/index' => 'gestion_projets#index', as: :index
  get '/projects/:id' =>'projects#show', as: :project
  root 'sessions#new'
  patch 'projects/:id' => 'projects#update'
  get '/projets_finis' => 'gestion_projets#projets_finis', as: :projets_finis

  

   
  resources :formulaires
    

  scope :administrator do
    resources :users
    resources :projects
    resources :groupes
    resources :liaison_juries
    resources :type_projets
    resources :liaison_groupe_eleves
    resources :rapports
    resources :questions
    resources :categories
  end
end
