Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# root_to 'cocktails#index'
  resources :cocktails, only: [:create, :show, :new, :index] do
    resources :doses, only: [:create, :show, :new, :index, :destroy]
  end
end
