Bettercoder::Application.routes.draw do
  get 'site/index'

  match 'install' => 'install#new', :via => :get
  match 'install' => 'install#index', :via => :post
  get 'install/new'

  root :to => 'site#index'
end

