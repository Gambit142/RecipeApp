Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :recipes, except: [ :update ] do
    resources :ingredients, controller: 'ingredients', except: [ :index, :show ], shallow: true
  end
  resources :foods, except: [ :show, :update]
  
  get 'general_shopping_list', to: 'general_shopping_list#index', as: :shopping_list
  get 'public_recipes', to: 'recipes#public_recipes', as: :public_recipes

  root 'general_shopping_list#index'
end
