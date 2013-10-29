SearchDemo::Application.routes.draw do
  root to: "home#index"
  match 'search', to: 'home#search', as: :search
  #match '/auth/:provider/callback' => 'sessions#create'
  #match 'auth/failure', to: redirect('/')
end
