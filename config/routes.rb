Rails.application.routes.draw do

  devise_for :users
  root 'spangular#index'

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  devise_scope :user do
        get "sign_up", to: 'devise/registrations#new'
        get "sign_in", to: "devise/sessions#new"
        get "login", :to => "devise/sessions#new"
        delete "sign_out", :to => "devise/sessions#destroy"
        delete "logout", :to => "devise/sessions#destroy"
  end 
  
  authenticate :user do
    resources :spangular, only: [:index]
  end

  scope :api do
    scope :v1 do
      resources :users
    end
  end


  get '/oauth2callback', to: 'users#index'
end