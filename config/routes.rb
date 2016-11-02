Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users
  root "messages#index"

  get "/messages/:id", to: "messages#show", as: :message
end
