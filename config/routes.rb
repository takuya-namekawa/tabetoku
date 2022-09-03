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
  
  
end
  
scope module: :admin do

  resources :admins, only: [:edit, :update] do
    collection do
      get 'my_page' => 'admins#show'
    end
  end
  
  
end  
  
end
