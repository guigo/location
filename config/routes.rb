Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'entrar', sign_out: 'sair', sign_up: 'cadastrar' }
   
  namespace :admin do
   resources :cars
   resources :users
   post :get_car_models, to: 'cars#get_car_models'
  end
  
  namespace :portal do
    resources :main   
    resources :reserved_cars
    post :days_reserved, to: 'reserved_cars#days_reserved'
  end

  root to: 'portal/main#index'  
end
