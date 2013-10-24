SearchDemo::Application.routes.draw do
  root to: "home#index"
  match 'search', to: 'home#search', as: :search
end
