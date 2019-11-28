Rails.application.routes.draw do
  get 'revision_sessions/index'
  devise_for :users do
    resources :revision_sessions, only: [:index]
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :folders, only: [:create]

  resources :documents, only: [:index, :show, :create, :update] do
    resources :concepts, only: [:index, :create, :update]
  end
end
