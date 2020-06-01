Rails.application.routes.draw do
  resources :products do
    get :who_bought, on: :member
  end
  concern :reviewable do
    resources :reviews
  end
  resources :products, concern: :reviewable
  resources :users, concern: :reviewable
  resources :products, shallow: true do
    resources :reviews
  end

  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'admin/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :users
  resources :products do
    resources :reviews
    get :who_bought, on: :member
  end

  resources :support_requests, only: [ :index, :update ]

  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end
  # For details on the DSL available within this file, see
  # https://guides.rubyonrails.org/routing.html
end
