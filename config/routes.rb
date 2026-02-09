Rails.application.routes.draw do
  # Public routes
  root "pages#home"

  # Pages statiques
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  post "contact", to: "pages#create_contact"

  # Portfolio
  get "/works", to: "pages#works"
  get "/works/:slug", to: "works#show", as: "work"
  post "/works/:slug/track_view", to: "works#track_view", as: "track_work_view"

  # Redirections pour SEO
  get "portfolio", to: redirect("/works")
  get "projects/:slug", to: redirect("/works/%{slug}")

  get "health", to: "health#show"
  get "up", to: "health#show"

  # Admin
  namespace :admin do
    root "dashboard#index"
    resources :works do
      member do
        patch :move_up
        patch :move_down
        patch :toggle_featured
      end
    end
    resources :messages, only: [:index, :show, :destroy]
    resources :analytics, only: [:index]
  end

  # API endpoints
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :works, only: [:index, :show]
      post "contact", to: "contacts#create"
    end
  end

  # Health check pour monitoring
  get "up" => "rails/health#show", as: :rails_health_check

  # ActiveStorage - DOIT ÊTRE AVANT LE CATCH-ALL
  mount ActiveStorage::Engine => "/rails/active_storage"

  # Catch-all pour 404 personnalisé - DOIT ÊTRE EN DERNIER
  match "*path", to: "pages#not_found", via: :all
end
