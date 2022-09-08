Rails.application.routes.draw do


# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者/shop用
# URL /admins/sign_in ...
devise_for :admins,skip: [:passwords], controllers: {
  registrations: "admin/registrations",
  sessions: "admin/sessions"
}



scope module: :public do
  root to: 'homes#top'
  resources :customers, only: [:edit, :update] do
    collection do
      get 'my_page' => 'customers#show'
    end
  end
  resources :items, only: [:index, :show] do
    get '/genre_items' => 'items#genre_items'
  end
  resources :cart_items, only: [:index, :update, :destroy, :create] do
    collection do
      delete 'all_destroy'
    end
  end
  get 'orders/confirm' => 'orders#confirm', as: 'confirm'
  get 'orders/thanks' => 'orders#thanks', as: 'thanks'
  resources :orders, only: [:new, :create, :index, ]
end

namespace :admin do

  resources :admins, only: [:edit, :update] do
    collection do
      get 'my_page' => 'admins#show'
    end
  end
  resources :items, only: [:index, :new, :create, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :reserves, only: [:index, :show, :create, :update]
end

end
