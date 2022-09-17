Rails.application.routes.draw do

root :to => 'public/homes#top'
get 'about' => 'public/homes#about'

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
    resources :customers, only: [:show, :edit, :update]
    #以下正しいか要検証
    get 'customers' => 'customers#unsubscribe'
    patch 'customers' => 'customers#withdraw'

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
