Bettercoder::Application.routes.draw do
  get 'site/index'

  match 'install' => 'install#new', :via => :get, :as => :site_configs
  match 'install' => 'install#create', :via => :post
  get 'install/new'

  root :to => 'site#index'
end

