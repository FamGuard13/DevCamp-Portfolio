Rails.application.routes.draw do

  root to: 'pages#home'
  get 'about-me', to: 'pages#about'
  get 'qualifications', to: 'pages#qualifications'

  scope '/qualifications' do
    resources :schools, :jobs, except: [:show]

    get 'school/:id', to: 'schools#show', as: "school_show"
    get 'job/:id', to: 'jobs#show', as: 'job_show'
  end

  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
 

  get 'contact', to: 'pages#contact'

  devise_for :users, path: '', path_names: { sign_in: 'admin-login', sign_out: 'logout', sign_up: 'register' }

  mount ActionCable.server => '/cable'
  
end