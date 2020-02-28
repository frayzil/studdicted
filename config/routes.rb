Rails.application.routes.draw do

  root to: 'knowledge/concepts#index'

  namespace :curriculum do
    resources :topics
    resources :boards
  end
  namespace :learning do
    resources :skills
    resources :skills_knowledge_concpets
  end
  namespace :knowledge do
    resources :concepts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
