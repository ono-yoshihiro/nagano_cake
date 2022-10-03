Rails.application.routes.draw do

root :to => 'public/homes#top'
get 'about' => 'public/homes#about'
get 'items' => 'public/items#index'
get 'items/:id' => 'public/items#show', as: 'item'
get 'customers/my_page' => 'public/customers#show'
get 'customers/information/edit' => 'public/customers#edit'
patch 'customers/information' => 'public/customers#update'
get 'customers/unsubscribe' => 'public/customers#unsubscribe'
patch 'customers/withdraw' => 'public/customers#withdraw'
get 'cart_items' => 'public/cart_items#index'
patch 'cart_items/:id' => 'public/cart_items#update'
delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'
delete 'cart_items/:id' => 'public/cart_items#destroy'
post 'cart_items' => 'public/cart_items#create'
get 'orders/new' => 'public/orders#new'
post 'orders/confirm' => 'public/orders#confirm'
get 'orders/complete' => 'public/orders#complete'
post 'orders' => 'public/orders#create'
get 'orders' => 'public/orders#index'
get 'orders/:id' => 'public/orders#show'
get 'addresses' => 'public/addresses#index'
post 'addresses' => 'public/addresses#create'
get 'addresses/:id/edit' => 'public/addresses#edit', as: 'edit_addresses'
patch 'addresses/:id' => 'public/addresses#update'
delete 'addresses/:id' => 'public/addresses#destroy', as: 'destroy_addresses'

# 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

# 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :public do

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
