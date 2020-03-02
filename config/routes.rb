# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'knowledge/concepts#index'

  namespace :curriculum, shallow: true do
    resources :boards do
      resources :subjects do
        resources :branches do
          resources :chapters do
            resources :sections do
              resources :learning_skills, controller: :sections_learning_skills
            end

            resources :sections_learning_skills, only: :destroy
          end
        end
      end
    end
  end

  namespace :learning, shallow: true do
    resources :skills do
      resources :knowledge_concepts, controller: :skills_knowledge_concepts
    end

    resources :skills_knowledge_concepts, only: :destroy
  end

  namespace :knowledge, shallow: true do
    resources :concepts do
      resources :skills, controller: :concepts_learning_skills
    end
  end

  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html
end
