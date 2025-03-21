Rails.application.routes.draw do
  root to: "pages#home"
  get "/works", to: "pages#works"
  get "/show", to: "pages#show"
  get "/contact", to: "pages#contact"
end
