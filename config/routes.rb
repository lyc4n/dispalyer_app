Rails.application.routes.draw do

  root to: "announcements#index"
  resources :announcements, only: [:index, :show, :new, :create, :edit], param: :key

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
