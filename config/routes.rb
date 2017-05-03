Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  get ':id', to: 'accounts#show', as: :account
  scope ':account_id' do
    resources :cards, path: '', only: :show, constraints: { id: /\d*/ }
    resources :cards, only: [:new, :create]
  end

  root 'pages#index'
end
