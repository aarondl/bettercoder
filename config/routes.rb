Bettercoder::Application.routes.draw do
  get 'site/index'

  match 'install' => 'install#new', :via => :get, :as => :site_configs
  match 'install' => 'install#create', :via => :post
  get 'install/new'

  namespace :overlord do
    get 'login' => 'login#index'
    post 'login' => 'login#dologin'
    get 'logout' => 'logout#dologout'

    get 'dashboard' => 'dashboard#index'
  end

  root :to => 'site#index'
end

