Rails.application.routes.draw do
  resources :orders
  resources :food_items
  resources :orders 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'menu' => 'menu'
 
  get 'about_us' => 'home#about_us'

  root "home#index"
end
