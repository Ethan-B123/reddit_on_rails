Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: %i(new create)
  resource :session, only: %i(new create destroy)
  resources :subs
  resources :posts, only: %i(new create show destroy update edit) do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:show] do
    resources :comments, only: [:create]
  end

end
