Rails.application.routes.draw do
  get 'cars/index'
  devise_for :users, path: '', path_names: { sign_in: 'entrar', sign_out: 'sair', sign_up: 'cadastrar' }
   
  namespace :admin do
   resources :dashs
   resources :users
   resources :cars
  end
  
  namespace :portal do
    resources :main
    post :reserved_cars, to: 'mains#reserved_cars'   
  end

  root to: 'portal/main#index'
end
