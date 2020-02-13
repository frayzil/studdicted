Rails.application.routes.draw do
  namespace :curriculum do
    resources :boards
  end
  namespace :learning do
    resources :skills
  end
  namespace :knowledge do
    resources :concepts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end