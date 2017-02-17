Rails.application.routes.draw do
  resources :food_items do
    resources :orders
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'menu' => 'menu'
 
  get 'about_us' => 'home#about_us'

  get 'all_orders' => 'orders#all'

  root "home#index"
end