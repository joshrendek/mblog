Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/:year/:month/:slug', to: 'contents#show', as: :blog_internal,
      constraints: { year: /[0-9]\d{0,4}/, month: /[a-zA-Z0-9]\d{0,2}/}

  get :archives, to: 'contents#archives'

  namespace :admin do
    resources :settings
    resources :contents
    root to: 'dashboard#index'
  end

  root to: 'contents#index'
end
