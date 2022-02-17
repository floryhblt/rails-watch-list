Rails.application.routes.draw do
  get 'bookmark/new'
  get 'bookmark/destroy'
  # get 'lists/new'
  # get 'lists/index'
  # get 'lists/show'
  # get 'lists/create'
  resources :lists, only: [:new, :index, :show, :create] do 
    resources :bookmarks, only: [ :new, :create ]
  end
  resources :bookmarks, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
