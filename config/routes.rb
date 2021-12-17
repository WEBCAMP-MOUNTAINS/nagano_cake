Rails.application.routes.draw do
devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  root to: 'public/homes#top'
  get 'public/homes/about' => 'homes#about', as: 'about'
  resources :public/items, only: [:index, :show]
  resources :public/customers, only: [:show, :edit, :update, :unsubscribe, :withbraw]
  resources :public/cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  resources :public/orders, only: [:new, :confirm, :complete, :create, :index, show]
  resources :public/addresses, only: [:index, :edit, :create, :update, :destroy]

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  root to: 'admin/homes#top'
  resources :admin/items, only: [:index, :new, :create, :show, :edit, :update]
  resources :admin/genres, only: [:index, :create, :edit, :update]
  resources :admin/customers, only: [:index, :show, :edit, :update]
  resources :admin/orders, only: [:show, :update] do
    resources :admin/order_details, only: [:update]
  end
end