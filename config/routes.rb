Rails.application.routes.draw do

  post 'revision_sessions_doc/:id', to: 'revision_sessions#create_from_doc', as: :revision_sessions_doc
  post 'revision_sessions_tag/:id', to: 'revision_sessions#create_from_tag', as: :revision_sessions_tag

  resources :tags, only: [:index, :destroy]

  resources :revision_sessions, only: [:index, :show, :destroy] do
    resources :session_answers, only: [:index, :create]
    put '/session_answers', to: 'session_answers#update'
  end

  devise_for :users

  delete 'documents/:id/concepts/', to: 'documents#destroy_concepts', as: :document_concepts

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :folders, only: [:create]

  resources :documents, only: [:index, :show, :new, :create, :update, :destroy] do
    resources :concepts, only: [:index, :create, :update]
  end

  get 'search', to: 'concepts#search'
  get 'template', to: 'pages#template'
  get 'archive', to: 'pages#archive'
end
