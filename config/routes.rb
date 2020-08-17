Rails.application.routes.draw do
  resources :units, only: [:index, :show]
  resources :groups, only: [:create, :destroy, :index, :show, :update] do
    resources :supplies, only: [:create, :destroy, :index, :show, :update] do
      resources :events, only: [:index]
      resources :items, only: [:create, :destroy, :index, :show, :update] do
        # resources :events, only: [:index, :create]
      end
      resources :users, only: [:create, :destroy, :index, :show, :update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end