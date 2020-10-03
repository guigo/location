Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'entrar', sign_out: 'sair', sign_up: 'cadastrar' }
   
  namespace :admin do
   resources :dash
  end
  
  root to: 'portal/main#index'
end
