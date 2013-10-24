SearchDemo::Application.routes.draw do
  root to: "home#index"
  get 'search/:words', to: 'home#search', as: :search
end
