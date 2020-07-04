Rails.application.routes.draw do
  
  # /post/1/comments/edit/:1
  resources :posts do 
    resources :comments
  end

  # /comments/:1/comment/edit/1
  resources :comments do
    resources :comments
  end

  get 'history', to: 'comments#history'
  devise_for :users
  root 'posts#index'
  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
