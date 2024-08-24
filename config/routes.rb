Rails.application.routes.draw do
  devise_for :users
  root :to => 'homes#top'
  resources :users, only: [:index, :show, :edit, :update]
  resources :posts, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  get 'homes/top'
  get 'homes/about'
  # 退会確認画面
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  # 論理削除用のルーティング
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
