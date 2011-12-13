Alpha::Application.routes.draw do

  root :to => "rosters#index"
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end
  resources :users
  resources :rosters do
    put 'nevientpas'
  end




end
