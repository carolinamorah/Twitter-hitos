Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :tweets do 
    #post :follower #es el metodo creado en tweet controller para poder crear el seguir friend
    resources :likes 
    member do
      post :retweet #es el metodo creado en tweet controller para dar la acción 
    end
  end

  namespace :api do
    resources :tweets
  end

  # resources :users do 
  #   resources :friends
  # end

  get '/:hashtag', to: 'tweets#hashtag_search', as: 'hashtag'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
    } 

    devise_scope :user do
      post 'follow/:id', to: 'friends#follow', as: 'follow_user'
    delete 'follow/:id', to: 'friends#unfollow', as: 'unfollow_user'
    end
    
    get '/api/news', to: 'api/apis#index'
    get "/api/:date1/:date2", to: 'api/apis#date'
    post '/api/create', to: 'api/apis#create'
    get 'mytweets/index'

  root "tweets#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
