Rails.application.routes.draw do
  
  devise_for :users
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  root 'groups#index'
  
  get 'favorites' => 'posts#favorites'
  get 'trending' => 'posts#trending'
  get 'search' => 'users#search', as: :users_search

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :groups do 
    resources :posts do
      member do
        put "like" => "posts#upvote"
        put "clap" => "posts#claps"
        delete "clap" => "posts#unclap"
      end
      resources :comments do
        member do
          put "clap" => "comments#claps"
          delete "clap" => "comments#unclap"
        end
      end
    end
    resources :users, only: [:index]
  end

  resources :users
  
  # API Routes

  namespace 'api' do
    namespace 'v1' do
      # devise_for :users
      resources :groups
      # , :only=>[:index, :show]
      resources :users
      resources :posts
      resources :comments
      resources :user_comment_claps
      resources :user_post_claps
      resources :user_post_bookmarks
    end
  end
end
