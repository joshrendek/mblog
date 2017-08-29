Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/:year/:month/:slug', to: 'contents#show', as: :blog_internal

  namespace :admin do
    resources :contents
  end

  root to: 'contents#index'
end
