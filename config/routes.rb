Rails.application.routes.draw do
  root to: "pages#home"

  get "/works", to: "pages#works"
  get "/contact", to: "pages#contact"
  get "/works/:slug", to: "works#show", as: "work"

  # ➤ Montre les routes d'Active Storage
  mount ActiveStorage::Engine => "/rails/active_storage"

  direct :rails_blob do |blob|
    route_for(:rails_service_blob, blob.signed_id, blob.filename)
  end

  direct :rails_blob_variant do |variant|
    route_for(:rails_blob_representation, variant.blob.signed_id, variant.variation.key, variant.blob.filename)
  end

  # ➤ Définit l'URL de base pour les blobs (facultatif en local mais utile)
  Rails.application.routes.default_url_options[:host] = "localhost:3000"
end
