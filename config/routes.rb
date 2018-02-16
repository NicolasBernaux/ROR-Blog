Rails.application.routes.draw do

  devise_for :users
  get 'users/new'
  root 'pages#index'


  get 'user/:id', to: 'posts#user_posts'

  resources :posts do
    resources :comments
  end

  # error pages
  %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
