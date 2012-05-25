DealSite::Application.routes.draw do
  resources :advertisers do
    resource :publisher
  end

  resources :deals do
    resource :advertiser
  end

  resources :publishers do
    resources :advertisers
  end

  match '/' => 'publishers#index', :as => :root
end
