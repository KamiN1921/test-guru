Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  get 'login', to: 'session#new'
  get 'logout', to: 'session#destroy'

  resources :users, only: :create
  resources :session, only: :create

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "tests#index"
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :result
    end
  end
end
