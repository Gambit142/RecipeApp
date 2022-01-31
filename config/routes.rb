Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :recipes, except: [ :update ]
  resources :foods, except: [ :show, :update]

  get 'public_recipes', to: 'recipes#public_recipes', as: :public_recipes

  root 'home#index'

end
