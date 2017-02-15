Rails.application.routes.draw do

  root 'welcome#index'

  resources :users do
    get :books, on: :member
  end
  
  resources :sessions

  resources :books

  namespace :admin do
    root 'users#index'

    resources :users do
      collection do
        get :search
      end
    end
  end

end
