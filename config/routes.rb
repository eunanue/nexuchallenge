Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :brands do
        resources :models, only: [:create,:index]
      end
      resources :models, only: [:update]
      get 'models', to: 'models#search'
    end
  end

end
