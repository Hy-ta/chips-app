Rails.application.routes.draw do
  get 'events/index'
  get 'events/new'
  get 'events/show'
  get 'events/edit'
  get 'events/delete'
  root to: "pages#index"
 
  devise_for :users, controllers: {
    :omniauth_callbacks => 'users/omniauth_callbacks',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  resources :users, only: [:show]
end
