Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items do
    resources :orders, only: [:index, :create, :new, :show, :destroy, :edit, :update]
  end
  post 'items/:id/edit' => 'items#edit'
end
