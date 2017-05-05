Rails.application.routes.draw do
  get 'organisations/index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :organisations do
    resources :cards
  end

  root 'pages#index'
end
