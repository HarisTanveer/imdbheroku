Rails.application.routes.draw do
  resources :reported_reviews

  resources :reviews

  resources :actors

  mount Ckeditor::Engine => '/ckeditor'

  resources :movies

  devise_for :users

  get 'users/:id', to: 'users#show', as: 'user_show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'



  
  resources :movies do
    member do
      post 'delete_image/:image_id', to: 'movies#delete_image', as: :delete_image_from
      post ':actor_id/addActor', to: 'movies#addActor'
    end

    member do
      post 'add_review', to: 'reviews#add_review', as: :add_review
    end

    member do
      post 'users/:user_id/add_favourite', to: 'users#add_favourite', as: :add_movie_to_user_favourites
      post 'users/:user_id/delete_favourite', to: 'users#delete_favourite', as: :remove_movie_from_user_favourites
    end

    resources :actors do 
     get 'detach'
    end
  end


  namespace :admin do
    resources :users do
      get 'make_admin', to: 'users#make_admin'
      get 'remove_admin', to: 'users#remove_admin'
    end
    resources :reported_reviews do
      get '/admin/reported_reviews', to: 'reported_reviews#index'
    end
  end
end
