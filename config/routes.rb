Rails.application.routes.draw do
  
devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
  
  scope module: :public do
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      delete 'destroy_all' => 'cart_items#destroy_all', on: :collection
    end
    resources :orders, only: [:new, :create, :index, :show] do
      post 'confirm' => 'orders#confirm', on: :collection
      get 'complete' => 'orders#complete', on: :collection
    end
    resources :customers, only: [:show, :edit, :update] do
      get 'unsubscribe' => 'customers#unsubscribe', on: :collection
      patch 'withdraw'  => 'customers#withdraw', on: :collection
    end
  end



 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  registrations: "admin/registrations",
  sessions: "admin/sessions"
}

  #root to: 'admin/homes#top'
  get '/admin' => 'admin/homes#top'

  namespace :admin do
    resources :items, except: :destroy
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update], on: :collection
    end
  end
  
end