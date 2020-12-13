Rails.application.routes.draw do

  resources :follows, constraints: {onlyajax: true}, only: [:create, :destroy]
  devise_for :users
  resources :posts, except: [:new]
  resources :comments, constraints: {onlyajax: true}, except: [:show, :new, :edit, :index]
  resources :profiles
  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'
  root 'home#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
