Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    get    "sign_in",  to: "devise/sessions#new",         as: :new_user_session
    post   "sign_in",  to: "devise/sessions#create",      as: :user_session
    delete "sign_out", to: "devise/sessions#destroy",     as: :destroy_user_session
 
    get    "sign_up",  to: "devise/registrations#new",    as: :new_user_registration
    post   "sign_up",  to: "devise/registrations#create", as: :user_registration
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  resources :posts, only: [:index, :new, :show, :create] do
    resources :comments, only: [:create]
  end

  namespace :api do
    get 'posts', to: "posts#index"
  end

end
