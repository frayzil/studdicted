Rails.application.routes.draw do
  namespace :knowledge do
    resources :concepts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
