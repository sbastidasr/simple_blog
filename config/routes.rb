Rails.application.routes.draw do
  resources :articles
   root :to => 'posts#index'

  resources :posts do
    resources :comments, :only => [:create]
  end
  resources :articles do
    resources :comments, :only => [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
