Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'tests#index'
  resources :tests, only: :index do
    member do
      post :start
    end
  end
  resources :feedback, only: %i[index create]

  resources :results, only: %i[show update] do
    member do
      get :result
      get :gist
    end
  end

  namespace :admin do
    resources :gists, only: %i[show index]
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
