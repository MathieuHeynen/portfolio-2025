Rails.application.routes.draw do
  root to: "pages#home"

  get "/works", to: "pages#works"
  get "/contact", to: "pages#contact"

  get "/works/:slug", to: "works#show", as: "work"
end
