Rails.application.routes.draw do

  root to: "pages#index"
 
  devise_for :users, controllers: {
    :omniauth_callbacks => 'users/omniauth_callbacks',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  
  devise_scope :user do
    get "users/show", :to => "users/user_id#show"
    get "user/id", :to => "users/registration#detail"
    get "signup", :to => "users/registration#new"
    get "sign_in", :to => "devise/sessions#new"
    get "logout", :to => "users/sessions#destroy" 
  end

  resources :users do
    resources :events
  end
end
