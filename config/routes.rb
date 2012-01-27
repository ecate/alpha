Alpha::Application.routes.draw do

  root :to => "rosters#index"

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users

  resources :missions do
    member do
      post :envoyerspa
    end

  end

  resources :rosters do
    member do
     post :nevientpas
    end
  end

end
