Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: %i(new create)
  resource :session, only: %i(new create destroy)
  resources :subs do
    resources :posts, only: %i(new create)
  end
  resources :posts, only: %i(show destroy update edit)

end
