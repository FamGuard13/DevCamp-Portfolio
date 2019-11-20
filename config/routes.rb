Rails.application.routes.draw do
  resources :schools
  resources :jobs
  resources :topics, only: [:index, :show]

  devise_for :users, path: '', path_names: { sign_in: 'admin-login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  get 'school/:id', to: 'schools#show', as: 'school_show'
 
  mount ActionCable.server => '/cable'
  
  root to: 'pages#home'
end