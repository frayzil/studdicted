Rails.application.routes.draw do

  root to: 'knowledge/concepts#index'

  namespace :curriculum do
    resources :topics
    resources :boards
  end

  namespace :learning do
    resources :skills
    resources :skills_knowledge_concepts
  end

  namespace :knowledge, shallow: true do
    resources :concepts do
      resources :skills, controller: :concepts_learning_skills
    end
  end

  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html
end
