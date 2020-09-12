Rails.application.routes.draw do

	devise_for :users
  resources :users,only: [:show,:edit,:update,:index]
  resources :books, only: [:index, :create, :edit, :update, :destroy, :show] do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end

  root 'home#top'
  get 'home/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
