Rails.application.routes.draw do
  root "blogs#index"
  resources :blogs, only: [:show, :index, :new, :create, :edit, :update]
end
