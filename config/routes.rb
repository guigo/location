Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'entrar', sign_out: 'sair', sign_up: 'cadastrar' }
  
  root to: 'main#index'
end
