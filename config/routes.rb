Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'about_us' => 'home#about_us'

  root "home#index"
end
